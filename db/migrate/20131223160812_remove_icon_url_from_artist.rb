class RemoveIconUrlFromArtist < ActiveRecord::Migration
  def up
    remove_column :artists, :icon_url
  end

  def down
    add_column :artists, :icon_url, :string
  end
end
