class Subscription < ActiveRecord::Base
  attr_accessible :artist_id

  belongs_to :artist, touch: true
  belongs_to :user, touch: true
end
