class CreatePodcastTimes < ActiveRecord::Migration
  def change
    create_table :podcast_times do |t|
      t.belongs_to :user
      t.belongs_to :podcast
      t.integer :time

      t.timestamps
    end

    add_index :podcast_times, :user_id
    add_index :podcast_times, :podcast_id
  end
end
