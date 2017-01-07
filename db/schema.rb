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

ActiveRecord::Schema.define(version: 20161122151925) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string   "brand"
    t.string   "model"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "musics", force: :cascade do |t|
    t.string   "artist"
    t.string   "album"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rf_contents", force: :cascade do |t|
    t.text     "body"
    t.integer  "subject_id"
    t.integer  "authorable_id"
    t.string   "authorable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "rf_contents", ["authorable_type", "authorable_id"], name: "index_rf_contents_on_authorable_type_and_authorable_id", using: :btree
  add_index "rf_contents", ["subject_id"], name: "index_rf_contents_on_subject_id", using: :btree

  create_table "rf_reader_infos", force: :cascade do |t|
    t.boolean  "read"
    t.string   "uuid"
    t.integer  "subject_id"
    t.integer  "recipient_id"
    t.string   "reciveable_type"
    t.integer  "reciveable_id"
    t.boolean  "internal"
    t.string   "notifications"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "rf_reader_infos", ["recipient_id"], name: "index_rf_reader_infos_on_recipient_id", using: :btree
  add_index "rf_reader_infos", ["reciveable_type", "reciveable_id"], name: "index_rf_reader_infos_on_reciveable_type_and_reciveable_id", using: :btree
  add_index "rf_reader_infos", ["subject_id"], name: "index_rf_reader_infos_on_subject_id", using: :btree

  create_table "rf_recipients", force: :cascade do |t|
    t.string   "messageble_type"
    t.integer  "messageble_id"
    t.string   "reciveable_type"
    t.integer  "reciveable_id"
    t.boolean  "internal"
    t.string   "notifications"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "rf_recipients", ["messageble_type", "messageble_id"], name: "index_rf_recipients_on_messageble_type_and_messageble_id", using: :btree
  add_index "rf_recipients", ["reciveable_type", "reciveable_id"], name: "index_rf_recipients_on_reciveable_type_and_reciveable_id", using: :btree

  create_table "rf_subjects", force: :cascade do |t|
    t.string   "title"
    t.integer  "contents_count",          default: 0
    t.integer  "reader_infos_count",      default: 0
    t.string   "messageable_type"
    t.integer  "messageable_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  add_index "rf_subjects", ["messageable_type", "messageable_id"], name: "index_rf_subjects_on_messageable_type_and_messageable_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
