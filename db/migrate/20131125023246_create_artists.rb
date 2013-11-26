# -*- encoding : utf-8 -*-
class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string  :name
      t.string  :channel_title
      t.text    :channel_description
      t.string  :url
      t.string  :icon_url

      t.timestamps
    end
  end
end
