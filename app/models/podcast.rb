# -*- encoding : utf-8 -*-
class Podcast < ActiveRecord::Base
  attr_accessible :duration, :file_url, 
   :guid, :published, :summary, :title   


belongs_to :artist

validates :title, presence: true
validates :duration, presence: true
validates :guid, presence: true, uniqueness: true
validates :published, presence: true 
validates :summary, presence: true
validates :file_url, presence: true, format: {with: URI.regexp}
validates_datetime :published






end


