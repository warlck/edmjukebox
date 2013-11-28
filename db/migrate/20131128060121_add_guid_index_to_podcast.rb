class AddGuidIndexToPodcast < ActiveRecord::Migration
  def change
  	add_index :podcasts, :guid
  	add_index :podcasts, :artist_id
  end
end
