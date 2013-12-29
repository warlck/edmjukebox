# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131229090828) do

  create_table "artists", :force => true do |t|
    t.string   "name"
    t.string   "channel_title"
    t.text     "channel_description"
    t.string   "url"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "feed_url"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "podcasts", :force => true do |t|
    t.string   "title"
    t.text     "summary"
    t.string   "guid"
    t.date     "published"
    t.string   "file_url"
    t.string   "duration"
    t.integer  "artist_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "podcasts", ["artist_id"], :name => "index_podcasts_on_artist_id"
  add_index "podcasts", ["guid"], :name => "index_podcasts_on_guid"

  create_table "subscriptions", :force => true do |t|
    t.integer "user_id"
    t.integer "artist_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "name"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

end
