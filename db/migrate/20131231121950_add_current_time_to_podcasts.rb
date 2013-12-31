class AddCurrentTimeToPodcasts < ActiveRecord::Migration
  def change
    add_column :podcasts, :current_time, :integer
  end
end
