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

ActiveRecord::Schema.define(version: 2019_09_30_172332) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "company"
    t.string "first_name"
    t.string "last_name"
    t.string "street_address"
    t.string "apartment"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "country"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.string "name"
    t.string "caller_number"
    t.datetime "start_date"
    t.integer "status", default: 0
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_campaigns_on_user_id"
  end

  create_table "campaigns_users", force: :cascade do |t|
    t.bigint "profile_id"
    t.bigint "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_campaigns_users_on_campaign_id"
    t.index ["profile_id"], name: "index_campaigns_users_on_profile_id"
  end

  create_table "compaigns", force: :cascade do |t|
    t.string "name"
    t.string "caller_number"
    t.datetime "start_date"
    t.integer "status", default: 0
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_compaigns_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "current_balance", default: "2.0"
    t.decimal "low_balance", default: "1.0"
    t.string "payment_method"
    t.string "card_number"
    t.string "cvc"
    t.string "card_name"
    t.integer "valid_month", default: 0
    t.integer "valid_year", default: 0
    t.boolean "active", default: true
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "full_name"
    t.string "title"
    t.text "bio"
    t.string "country"
    t.decimal "cost"
    t.string "picture_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "skills"
    t.text "industry_expertise"
    t.text "languages"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone_number"
    t.string "country"
    t.string "time_zone"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "campaigns", "users"
  add_foreign_key "campaigns_users", "campaigns"
  add_foreign_key "campaigns_users", "profiles"
  add_foreign_key "compaigns", "users"
  add_foreign_key "payments", "users"
end
