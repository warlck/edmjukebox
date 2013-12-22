# -*- encoding : utf-8 -*-
class Artist < ActiveRecord::Base

  include Concerns::FillingData

  attr_accessible  :channel_title, :channel_description, 
                  :icon_url, :name, :url, :feed_url


  
  validates :name, presence: true
  validates :channel_description, presence: true
  validates :channel_title, presence: true
  validates :url, presence: true, format: { with: URI.regexp }
  validates :icon_url, presence: true, format: { with: URI.regexp}
  validates :feed_url, presence: true

  
  has_many :podcasts, dependent: :destroy

  after_create :add_entries

  
  

  def self.create_artist feed_url
      feed = get_feed_data(feed_url)
      artist_from_feed feed, feed_url 
  end
     

end
