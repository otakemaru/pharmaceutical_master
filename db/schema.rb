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

ActiveRecord::Schema.define(version: 20150722190022) do

  create_table "efficacy_masters", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "gs1_masters", force: :cascade do |t|
    t.string   "a",          limit: 255
    t.string   "b",          limit: 255
    t.string   "c",          limit: 255
    t.string   "d",          limit: 255
    t.string   "e",          limit: 255
    t.string   "f",          limit: 255
    t.string   "g",          limit: 255
    t.string   "h",          limit: 255
    t.string   "i",          limit: 255
    t.string   "j",          limit: 255
    t.string   "aa",         limit: 255
    t.string   "ab",         limit: 255
    t.string   "ac",         limit: 255
    t.string   "ad",         limit: 255
    t.string   "ae",         limit: 255
    t.string   "af",         limit: 255
    t.string   "ag",         limit: 255
    t.string   "ah",         limit: 255
    t.string   "ai",         limit: 255
    t.string   "aj",         limit: 255
    t.string   "ba",         limit: 255
    t.string   "bb",         limit: 255
    t.string   "bc",         limit: 255
    t.string   "bd",         limit: 255
    t.string   "be",         limit: 255
    t.string   "bf",         limit: 255
    t.string   "bg",         limit: 255
    t.string   "bh",         limit: 255
    t.string   "bi",         limit: 255
    t.string   "bj",         limit: 255
    t.string   "ca",         limit: 255
    t.string   "cb",         limit: 255
    t.string   "cc",         limit: 255
    t.string   "cd",         limit: 255
    t.string   "ce",         limit: 255
    t.string   "cf",         limit: 255
    t.string   "cg",         limit: 255
    t.string   "ch",         limit: 255
    t.string   "ci",         limit: 255
    t.string   "cj",         limit: 255
    t.string   "da",         limit: 255
    t.string   "db",         limit: 255
    t.string   "dc",         limit: 255
    t.string   "dd",         limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "hot_masters", force: :cascade do |t|
    t.string   "a",          limit: 255
    t.string   "b",          limit: 255
    t.string   "c",          limit: 255
    t.string   "d",          limit: 255
    t.string   "e",          limit: 255
    t.string   "f",          limit: 255
    t.string   "g",          limit: 255
    t.string   "h",          limit: 255
    t.string   "i",          limit: 255
    t.string   "j",          limit: 255
    t.string   "aa",         limit: 255
    t.string   "ab",         limit: 255
    t.string   "ac",         limit: 255
    t.string   "ad",         limit: 255
    t.string   "ae",         limit: 255
    t.string   "af",         limit: 255
    t.string   "ag",         limit: 255
    t.string   "ah",         limit: 255
    t.string   "ai",         limit: 255
    t.string   "aj",         limit: 255
    t.string   "ba",         limit: 255
    t.string   "bb",         limit: 255
    t.string   "bc",         limit: 255
    t.string   "bd",         limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "pharmaceutical_masters", force: :cascade do |t|
    t.string   "a",          limit: 255
    t.string   "b",          limit: 255
    t.string   "c",          limit: 255
    t.string   "d",          limit: 255
    t.string   "e",          limit: 255
    t.string   "f",          limit: 255
    t.string   "g",          limit: 255
    t.string   "h",          limit: 255
    t.string   "i",          limit: 255
    t.string   "j",          limit: 255
    t.string   "aa",         limit: 255
    t.string   "ab",         limit: 255
    t.string   "ac",         limit: 255
    t.string   "ad",         limit: 255
    t.string   "ae",         limit: 255
    t.string   "af",         limit: 255
    t.string   "ag",         limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "price_masters", force: :cascade do |t|
    t.string   "a",          limit: 255
    t.string   "b",          limit: 255
    t.string   "c",          limit: 255
    t.string   "d",          limit: 255
    t.string   "e",          limit: 255
    t.string   "f",          limit: 255
    t.string   "g",          limit: 255
    t.string   "h",          limit: 255
    t.string   "i",          limit: 255
    t.string   "j",          limit: 255
    t.string   "aa",         limit: 255
    t.string   "ab",         limit: 255
    t.string   "ac",         limit: 255
    t.string   "ad",         limit: 255
    t.string   "ae",         limit: 255
    t.string   "af",         limit: 255
    t.string   "ag",         limit: 255
    t.string   "ah",         limit: 255
    t.string   "ai",         limit: 255
    t.string   "aj",         limit: 255
    t.string   "ba",         limit: 255
    t.string   "bb",         limit: 255
    t.string   "bc",         limit: 255
    t.string   "bd",         limit: 255
    t.string   "be",         limit: 255
    t.string   "bf",         limit: 255
    t.string   "bg",         limit: 255
    t.string   "bh",         limit: 255
    t.string   "bi",         limit: 255
    t.string   "bj",         limit: 255
    t.string   "ca",         limit: 255
    t.string   "cb",         limit: 255
    t.string   "cc",         limit: 255
    t.string   "cd",         limit: 255
    t.string   "ce",         limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "regulation_masters", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
