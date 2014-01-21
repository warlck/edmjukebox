module Concerns
	module FillingData
		extend ActiveSupport::Concern

		class ItunesFeed
			class_attribute :resource
			def initialize address
				@address = address
				@doc = init_doc 
				@doc.remove_namespaces!
			end



			def summary 
				attr "summary"
			end

			def author
				attr "author"
			end

			def image
				image = attr "image/@href"
				image = image.empty? ? attr("image/url") : image
			end

			private 

			def attr attribute 
				@doc.xpath("//channel/#{attribute}").inner_text
			end

			def init_doc 
				if resource == :filesystem
					# remove "file://" part
					@address = @address.slice(6..-1) 
					@doc = Nokogiri::XML(File.open(@address))
				elsif resource == :web || resource.nil?
					@doc = Nokogiri::XML(open(@address))
				end
			end

						

		end



		module ClassMethods

	       def get_feed_data feed_url
             Feedzirra::Feed.fetch_and_parse(feed_url)
           end	


		   private
	         def artist_from_feed feed, feed_url
	         	
	     	    unless feed == 0 
	     	    itunes_feed = ItunesFeed.new feed_url

		       	  create(
			        channel_description: itunes_feed.summary,
			       	channel_title: feed.title,
			     	name: itunes_feed.author,
			     	url: feed.url,
		            feed_url: feed_url,
		            image: open(itunes_feed.image)
		 	    )
		       end
	         end    
		end



		

		#Concern instance methods	


		private
	     def add_entries  
	       feed = Artist.get_feed_data(self.feed_url)
	       #debugger
	        feed.entries.each do |entry|
	          unless Podcast.exists?( guid: guid(entry))
	            add_podcast podcasts, entry
	          end
	        end
	     end

	     def add_podcast podcasts, entry
             podcasts << Podcast.create(
	              title: entry.title,
	              summary: summary(entry),
	              file_url: enclosure(entry),
	              guid: guid(entry),
	              duration: duration(entry),
	              published: entry.published
	            )
	     end

	     def enclosure entry
	        if entry.respond_to? :enclosure_url and !entry.enclosure_url.nil?
	        	entry.enclosure_url
	        elsif entry.respond_to? :url and !entry.url.nil?
	        	entry.url
	        else
	        	entry.image
	        end
	    end

	    def summary entry
	    	if entry.summary.empty? || entry.summary.nil?
	    		entry.itunes_summary
	    	else
	    		entry.summary
	    	end
	    end

	    def guid entry
	    	entry.title
    	end

    	def duration entry
    		if entry.respond_to? :itunes_duration
    			entry.itunes_duration
    		else
    			"1:00:00"
    		end
    	end
	end
end

