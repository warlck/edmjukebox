class Podcast < ActiveRecord::Base
  attr_accessible :belongs_to, :duration, :file_url, :guid, :published, :summary, :title
end
