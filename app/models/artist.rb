class Artist < ActiveRecord::Base
require 'factory_girl'
  attr_accessible :channel_title, :channel_description, :icon_url, :name, :url
  
  validates :name, presence: true
  validates :channel_description, presence: true
  validates :channel_title, presence: true
  validates :url, presence: true, format: { with: URI.regexp }
  validates :icon_url, presence: true, format: { with: URI.regexp}



  def self.create_artist feed_url
     feed = get_feed_data(feed_url)
     @artist = artist_from_feed feed  
  end


  private 

     def self.get_feed_data feed_url
          Feedzirra::Feed.fetch_and_parse(feed_url)
     end

     def self.artist_from_feed feed
     	unless feed == 0 
	     	Artist.create(
		     	channel_description: feed.itunes_summary,
		     	channel_title: feed.title,
		     	name: feed.itunes_author,
		     	url: feed.url,
		     	icon_url: feed.itunes_image
	 	    )
	    end
     end


end
