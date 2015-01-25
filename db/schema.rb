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

ActiveRecord::Schema.define(version: 20150121175640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.string   "subdomain"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "achievements", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon_src"
    t.string   "html_color"
    t.integer  "location_id"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.integer  "account_id"
    t.text     "description"
    t.text     "rules"
    t.text     "reward"
    t.string   "homepageimage_file_name"
    t.string   "homepageimage_content_type"
    t.integer  "homepageimage_file_size"
    t.datetime "homepageimage_updated_at"
    t.integer  "prereq_id"
  end

  create_table "brands", force: true do |t|
    t.string   "name"
    t.string   "normalized_name"
    t.text     "description"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.string   "domain"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
  end

  create_table "master_list_items", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "available"
    t.integer  "rating"
    t.text     "notes"
    t.string   "price"
    t.integer  "origin_id"
    t.integer  "brand_id"
    t.string   "custom1"
    t.string   "custom2"
    t.string   "custom3"
    t.string   "custom4"
    t.string   "custom5"
    t.string   "full_name"
    t.integer  "master_list_id"
    t.integer  "item_type_id"
    t.date     "date_added"
    t.integer  "task_id"
    t.boolean  "out_of_stock"
    t.boolean  "no_longer_produced"
    t.boolean  "rare"
    t.boolean  "new"
    t.boolean  "free_to_sample"
    t.decimal  "proof",              precision: 5, scale: 2
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "account_id"
  end

  create_table "master_lists", force: true do |t|
    t.string   "name"
    t.string   "itemname_label"
    t.string   "origin_label"
    t.integer  "location_id"
    t.boolean  "show_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
  end

  create_table "origins", force: true do |t|
    t.string   "name"
    t.string   "normalized_name"
    t.string   "address"
    t.text     "description"
    t.decimal  "lat",             precision: 10, scale: 6
    t.decimal  "lng",             precision: 10, scale: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.integer  "user_id"
    t.integer  "account_id"
    t.boolean  "super_admin"
    t.boolean  "list_manager"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: true do |t|
    t.integer  "account_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "tasks", force: true do |t|
    t.integer  "achievement_id"
    t.string   "name"
    t.integer  "master_list_id"
    t.integer  "total_items_needed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number_of_days"
    t.integer  "account_id"
  end

  create_table "user_achievements", force: true do |t|
    t.integer  "account_id"
    t.integer  "user_id"
    t.integer  "achievement_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "completed",      default: false
  end

  create_table "user_list_items", force: true do |t|
    t.integer  "user_id"
    t.integer  "master_list_item_id"
    t.boolean  "completed",           default: false
    t.date     "date_completed"
    t.integer  "approved_by_id"
    t.text     "tasting_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rating"
    t.integer  "master_list_id"
    t.integer  "approval_status"
    t.integer  "account_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "full_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
