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

ActiveRecord::Schema.define(version: 20160414110432) do

  create_table "ref_attributes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ref_meta", force: :cascade do |t|
    t.integer  "ref_id"
    t.string   "value"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "ref_attribute_id"
  end

  create_table "ref_type_fields", force: :cascade do |t|
    t.integer  "reftype_id"
    t.integer  "ref_attribute_id"
    t.integer  "obligatory"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "refs", force: :cascade do |t|
    t.integer  "reftype_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  create_table "reftypes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
