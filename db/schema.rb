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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160921172532) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "opinions", force: :cascade do |t|
    t.string   "item"
    t.string   "category"
    t.string   "field"
    t.integer  "user_id"
    t.integer  "upvotes"
    t.integer  "downvotes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "tags"
    t.string   "prep"
  end

  add_index "opinions", ["user_id"], name: "index_opinions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "opinions"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "opinion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "sentiment"
  end

  add_index "votes", ["opinion_id"], name: "index_votes_on_opinion_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

  add_foreign_key "opinions", "users"
  add_foreign_key "votes", "opinions"
  add_foreign_key "votes", "users"
end
