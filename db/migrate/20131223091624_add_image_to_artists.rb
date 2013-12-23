class AddImageToArtists < ActiveRecord::Migration
  def change
    add_attachment :artists, :image
  end
end
