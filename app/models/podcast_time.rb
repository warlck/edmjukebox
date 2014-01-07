class PodcastTime < ActiveRecord::Base
  attr_accessible :user_id, :podcast_id, :time

  belongs_to :user
  belongs_to :podcast
end
