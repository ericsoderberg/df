# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091114163011) do

  create_table "data_files", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "donations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.float    "amount"
    t.boolean  "received"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "location_ministries", :force => true do |t|
    t.integer  "ministry_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.integer  "x"
    t.integer  "y"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ministries", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.text     "contents"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "parameterized_name"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "cost"
    t.float    "raised"
    t.string   "code"
    t.boolean  "finished"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ministry_id"
    t.date     "start_at"
    t.date     "stop_at"
  end

  create_table "trips", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "start_at"
    t.date     "stop_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ministry_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name",                      :limit => 100
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "state",                                    :default => "passive"
    t.datetime "deleted_at"
    t.boolean  "administrator"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
