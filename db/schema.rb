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

ActiveRecord::Schema.define(version: 20160104112909) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.integer "user_id",                   null: false
    t.string  "name",          limit: 50
    t.text    "description"
    t.string  "country",                   null: false
    t.string  "city",                      null: false
    t.string  "market",                    null: false
    t.string  "category",                  null: false
    t.string  "short_name",    limit: 50,  null: false
    t.string  "slug",          limit: 100, null: false
    t.string  "logo"
    t.string  "cover"
    t.date    "founded_on"
    t.string  "gplay_link"
    t.string  "itunes_link"
    t.string  "dribbble_link"
    t.string  "fb_link"
    t.string  "gh_link"
    t.string  "gplus_link"
    t.string  "linkedin_link"
    t.string  "twitter_link"
    t.string  "youtube_link"
    t.string  "website"
    t.string  "short_desc"
  end

  add_index "companies", ["slug"], name: "index_companies_on_slug", unique: true, using: :btree
  add_index "companies", ["user_id"], name: "index_companies_on_user_id", using: :btree

  create_table "company_users", force: :cascade do |t|
    t.integer "company_id"
    t.string  "name",       limit: 100, null: false
    t.integer "role",                   null: false
    t.string  "title",      limit: 50,  null: false
  end

  add_index "company_users", ["company_id"], name: "index_company_users_on_company_id", using: :btree

  create_table "experiences", force: :cascade do |t|
    t.integer "user_id"
    t.string  "company_name",                 null: false
    t.integer "role",                         null: false
    t.string  "title",                        null: false
    t.date    "started_at",                   null: false
    t.date    "ended_at",                     null: false
    t.boolean "current",      default: false, null: false
    t.text    "description"
  end

  add_index "experiences", ["user_id", "role"], name: "index_experiences_on_user_id_and_role", using: :btree

  create_table "investings", force: :cascade do |t|
    t.integer "user_id"
    t.string  "amount"
    t.integer "deals_year"
    t.integer "confirmed_deals"
    t.boolean "visible",         default: true
  end

  add_index "investings", ["user_id"], name: "index_investings_on_user_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "first_name",             limit: 50,              null: false
    t.string   "last_name",              limit: 50,              null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "slug"
    t.string   "username",               limit: 50
    t.text     "about"
    t.string   "avatar"
    t.string   "cover"
    t.string   "country"
    t.string   "city"
    t.string   "gplay_link"
    t.string   "itunes_link"
    t.string   "dribbble_link"
    t.string   "fb_link"
    t.string   "gh_link"
    t.string   "gplus_link"
    t.string   "linkedin_link"
    t.string   "twitter_link"
    t.string   "youtube_link"
    t.string   "website"
    t.text     "short_resume"
    t.text     "what_do"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree

end
