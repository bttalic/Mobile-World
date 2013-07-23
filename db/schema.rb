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

ActiveRecord::Schema.define(:version => 20130526110917) do

  create_table "comments", :force => true do |t|
    t.string   "content"
    t.integer  "phone_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "compares", :force => true do |t|
    t.integer  "user_id"
    t.integer  "phone1_id"
    t.integer  "phone2_id"
    t.integer  "phone3_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "phones", :force => true do |t|
    t.string   "make"
    t.string   "model"
    t.integer  "sizeh"
    t.integer  "sizew"
    t.integer  "sized"
    t.float    "weight"
    t.string   "processor"
    t.float    "procfrequency"
    t.integer  "batterycapacity"
    t.integer  "talktime"
    t.integer  "standbytime"
    t.integer  "screensize"
    t.integer  "screenresh"
    t.integer  "screenresw"
    t.string   "screentype"
    t.integer  "screencolors"
    t.float    "mcamera"
    t.integer  "mcameraresph"
    t.integer  "mcamerarespw"
    t.integer  "mcameraresvh"
    t.integer  "mcameraresvw"
    t.string   "mcamerav"
    t.float    "scamera"
    t.float    "intmemory"
    t.float    "extmemory"
    t.string   "osname"
    t.string   "osversion"
    t.string   "gpu"
    t.boolean  "bt"
    t.boolean  "wlan"
    t.boolean  "ir"
    t.boolean  "usb"
    t.boolean  "nfc"
    t.boolean  "gprs"
    t.boolean  "g3g"
    t.string   "other"
    t.integer  "userid"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",               :default => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["name"], :name => "index_users_on_name", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
