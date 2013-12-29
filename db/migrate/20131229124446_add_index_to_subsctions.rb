class AddIndexToSubsctions < ActiveRecord::Migration
  def change
  	add_index :subscriptions, :user_id
  	add_index :subscriptions, :artist_id
  end
end
