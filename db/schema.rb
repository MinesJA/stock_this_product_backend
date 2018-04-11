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

ActiveRecord::Schema.define(version: 20180410185948) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "csvs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "csv_file_file_name"
    t.string "csv_file_content_type"
    t.integer "csv_file_file_size"
    t.datetime "csv_file_updated_at"
  end

  create_table "messages", force: :cascade do |t|
    t.string "customer_email"
    t.string "store_email"
    t.text "email_subject"
    t.text "email_body"
    t.integer "search_id"
    t.integer "producer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "producers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "searches", force: :cascade do |t|
    t.string "ip"
    t.text "location_data"
    t.string "search_term"
    t.integer "radius"
    t.integer "producer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "address_one"
    t.string "address_two"
    t.string "city"
    t.string "state"
    t.integer "zipcode"
    t.decimal "latitude", precision: 10, scale: 7
    t.decimal "longitude", precision: 10, scale: 7
    t.boolean "buys"
    t.string "phone"
    t.string "email"
    t.string "twitter_handle"
    t.string "facebook_page"
    t.integer "producer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "producer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
