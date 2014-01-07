class RemoveCurrentTimeFromPodcasts < ActiveRecord::Migration
  def change
  	remove_column :podcasts, :current_time
  end
  
end
