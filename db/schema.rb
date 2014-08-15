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

ActiveRecord::Schema.define(version: 20140815060352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bourbons", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "bourbon_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["bourbon_id"], name: "index_comments_on_bourbon_id", using: :btree

  create_table "payments", force: true do |t|
    t.string   "stripe_token"
    t.float    "amount"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["user_id"], name: "index_payments_on_user_id", using: :btree

  create_table "plans", force: true do |t|
    t.integer "amount"
  end

  create_table "subscriptions", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "stripe_customer_token"
    t.integer  "plan_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                                 null: false
    t.string   "password_digest",                       null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.boolean  "admin",                 default: false, null: false
    t.string   "stripe_customer_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
