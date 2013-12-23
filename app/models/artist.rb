# -*- encoding : utf-8 -*-
class Artist < ActiveRecord::Base
 
  include Concerns::FillingData

  attr_accessible  :channel_title, :channel_description, 
                   :name, :url, :feed_url, :image

  has_attached_file :image, styles: {
    thumb: '145x145'
  }

  
  has_many :podcasts, dependent: :destroy

  
  validates :name, presence: true
  validates :channel_description, presence: true
  validates :channel_title, presence: true
  validates :url, presence: true, format: { with: URI.regexp }
  validates :feed_url, presence: true


  validates_attachment :image, 
             presence: true,
             content_type: { content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif'] },
             size: { less_than: 5.megabytes  }


  after_create :add_entries



 
  
  

  def self.create_artist feed_url
      feed = get_feed_data(feed_url)
      artist_from_feed feed, feed_url 
  end
     


end
