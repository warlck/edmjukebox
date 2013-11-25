class Artist < ActiveRecord::Base
  attr_accessible :channel_title, :channel_description, :icon_url, :name, :website
end
