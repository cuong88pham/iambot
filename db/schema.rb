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

ActiveRecord::Schema.define(version: 20160423084239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bot_buttons", force: :cascade do |t|
    t.string   "title"
    t.string   "payload"
    t.string   "filter"
    t.integer  "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bot_messages", force: :cascade do |t|
    t.string   "message"
    t.integer  "button_id"
    t.integer  "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bot_shops", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string   "shop_name"
    t.string   "shop_token"
    t.string   "shop_domain"
    t.string   "access_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "shopping_message_id"
    t.integer  "welcome_message_id"
  end

  add_index "bot_shops", ["email"], name: "index_bot_shops_on_email", unique: true, using: :btree
  add_index "bot_shops", ["reset_password_token"], name: "index_bot_shops_on_reset_password_token", unique: true, using: :btree

  create_table "notifications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
