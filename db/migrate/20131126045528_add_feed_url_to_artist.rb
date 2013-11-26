class AddFeedUrlToArtist < ActiveRecord::Migration
  def change
  	add_column :artists, :feed_url, :string
  end
end
