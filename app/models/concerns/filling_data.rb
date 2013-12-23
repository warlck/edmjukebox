module Concerns
	module FillingData
		extend ActiveSupport::Concern

		module ClassMethods

	       def get_feed_data feed_url
             Feedzirra::Feed.fetch_and_parse(feed_url)
           end	


		   private
	         def artist_from_feed feed, feed_url
	     	    unless feed == 0 
		       	  create(
			        channel_description: feed.itunes_summary,
			       	channel_title: feed.title,
			     	name: feed.itunes_author,
			     	url: feed.url,
		            feed_url: feed_url,
		            image: open(feed.itunes_image)
		 	    )
		       end
	         end       
		end
		

		#Concern instance methods	

		private
	     def add_entries  
	       feed = Artist.get_feed_data(self.feed_url)
	        feed.entries.each do |entry|
	          unless Podcast.exists?( guid: entry.id)
	            podcasts << Podcast.create(
	              title: entry.title,
	              summary: entry.itunes_summary,
	              file_url: entry.enclosure_url,
	              guid: entry.id,
	              duration: entry.itunes_duration,
	              published: entry.published
	            )
	          end
	        end
	     end 
	
	end
end

