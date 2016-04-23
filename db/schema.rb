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

ActiveRecord::Schema.define(version: 20160423063158) do

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

  create_table "shops", force: :cascade do |t|
    t.string   "shop_domain"
    t.string   "shop_token"
    t.string   "name"
    t.string   "command"
    t.integer  "shopping_message_id"
    t.integer  "wellcome_message_id"
    t.integer  "status"
    t.integer  "subscription_type"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

end
