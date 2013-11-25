class Artist < ActiveRecord::Base

  attr_accessible :channel_title, :channel_description, :icon_url, :name, :url
  
  validates :name, presence: true
  validates :channel_description, presence: true
  validates :channel_title, presence: true
  validates :url, presence: true, format: { with: URI.regexp }
  validates :icon_url, presence: true, format: { with: URI.regexp}



  def self.create_artist feed_url
  end


end
