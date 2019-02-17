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

ActiveRecord::Schema.define(version: 20170305042126) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer  "use_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["use_id"], name: "index_accounts_on_use_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.date     "date_of_onset"
    t.string   "name"
    t.string   "remarks"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "histories", force: :cascade do |t|
    t.date     "date_of_onset"
    t.integer  "account_id"
    t.decimal  "price"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["account_id"], name: "index_histories_on_account_id", using: :btree
    t.index ["date_of_onset", "account_id"], name: "index_histories_on_date_of_onset_and_account_id", unique: true, using: :btree
  end

  create_table "uses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "accounts", "uses"
  add_foreign_key "histories", "accounts"
end
