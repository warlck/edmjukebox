class Subscription < ActiveRecord::Base
  attr_accessible :artist_id

  belongs_to :artist
  belongs_to :user
end
