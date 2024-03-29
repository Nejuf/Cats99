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

ActiveRecord::Schema.define(:version => 20131011234734) do

  create_table "cat_rental_requests", :force => true do |t|
    t.integer  "cat_id",                            :null => false
    t.date     "start_date"
    t.date     "end_date"
    t.string   "status",     :default => "PENDING"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "cat_rental_requests", ["cat_id"], :name => "index_cat_rental_requests_on_cat_id"

  create_table "cats", :force => true do |t|
    t.integer  "age"
    t.string   "birth_date"
    t.string   "color"
    t.string   "name"
    t.string   "sex"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "owner_id"
  end

  add_index "cats", ["owner_id"], :name => "index_cats_on_owner_id"

  create_table "sessions", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "token",      :null => false
    t.string   "device"
    t.string   "location"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["token"], :name => "index_sessions_on_token"
  add_index "sessions", ["user_id"], :name => "index_sessions_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "user_name",       :null => false
    t.string   "password_digest", :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
