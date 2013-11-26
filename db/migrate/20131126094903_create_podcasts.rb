# -*- encoding : utf-8 -*-
class CreatePodcasts < ActiveRecord::Migration
  def change
    create_table :podcasts do |t|
      t.string :title
      t.text :summary
      t.string :guid
      t.date :published
      t.string :file_url
      t.string :duration
      t.belongs_to :artist

      t.timestamps
    end
  end
end
