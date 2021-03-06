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

ActiveRecord::Schema.define(:version => 20130908044323) do

  create_table "edge_weights", :force => true do |t|
    t.integer "parent_id"
    t.integer "child_id"
    t.float   "value"
  end

  create_table "graphs", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.datetime "end_at"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "links", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "child_id"
    t.integer  "graph_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "link_type"
  end

  create_table "listed_urls", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "listed_type"
    t.integer  "graph_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "nodes", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "node_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "topics"
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "email"
    t.boolean  "admin"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

end
