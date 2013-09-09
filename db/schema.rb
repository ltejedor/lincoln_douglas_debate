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

ActiveRecord::Schema.define(:version => 20130909080436) do

  create_table "assets", :force => true do |t|
    t.string   "asset_file_name"
    t.integer  "asset_file_size"
    t.string   "asset_content_type"
    t.datetime "asset_updated_at"
    t.integer  "card_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "brackets", :force => true do |t|
    t.string   "name"
    t.integer  "round_id"
    t.integer  "division_id"
    t.datetime "starttime"
    t.string   "start_time_string"
  end

  create_table "cards", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "topic_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "cards", ["topic_id"], :name => "index_cards_on_topic_id"

  create_table "cases", :force => true do |t|
    t.string   "title"
    t.text     "description",   :limit => 255
    t.text     "content"
    t.string   "response_type"
    t.boolean  "anon"
    t.integer  "resolution_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "cases", ["resolution_id"], :name => "index_cases_on_resolution_id"

  create_table "competitors", :force => true do |t|
    t.integer "debater_id"
    t.integer "tournament_id"
    t.string  "division"
    t.integer "division_id"
  end

  create_table "critiques", :force => true do |t|
    t.string   "name"
    t.text     "body"
    t.integer  "case_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "critiques", ["case_id"], :name => "index_critiques_on_case_id"

  create_table "debaters", :force => true do |t|
    t.string   "level"
    t.integer  "user_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "rsvptournament_id"
  end

  create_table "divisions", :force => true do |t|
    t.string   "name"
    t.integer  "tournament_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "judge_registrations", :force => true do |t|
    t.integer  "judge_id"
    t.integer  "tournament_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "division_id"
  end

  create_table "judges", :force => true do |t|
    t.text     "paradigm"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "level"
  end

  create_table "judges_tournaments", :force => true do |t|
    t.integer "judge_id"
    t.integer "tournament_id"
  end

  create_table "matches", :force => true do |t|
  end

  create_table "organizers", :force => true do |t|
    t.integer "user_id"
  end

  create_table "pages", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "registrations", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "resolutions", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "current"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "round_brackets", :force => true do |t|
    t.integer "round_id"
    t.integer "bracket_id"
  end

  create_table "rounds", :force => true do |t|
    t.integer "order"
    t.integer "division_id"
    t.string  "kind"
    t.string  "subtype"
  end

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.string   "string"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.text     "source",     :limit => 255
    t.text     "body",       :limit => 255
    t.boolean  "starred"
  end

  create_table "tournaments", :force => true do |t|
    t.string   "name"
    t.text     "summary"
    t.text     "description"
    t.text     "entry_info"
    t.text     "divisions_info"
    t.text     "rules_info"
    t.text     "judges_info"
    t.text     "additional_info"
    t.string   "image"
    t.datetime "starttime"
    t.datetime "endtime"
    t.integer  "organizer_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.datetime "start"
    t.datetime "end"
    t.string   "asset_url"
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "name"
    t.string   "email"
    t.string   "image"
    t.string   "googleplus"
    t.string   "verified_email"
    t.string   "birthday"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.text     "summary"
    t.integer  "points"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "social_email"
    t.string   "website"
    t.string   "time_zone"
  end

  add_index "users", ["provider"], :name => "index_users_on_provider"
  add_index "users", ["uid"], :name => "index_users_on_uid"

end
