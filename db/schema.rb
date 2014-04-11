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

ActiveRecord::Schema.define(version: 20140411095311) do

  create_table "api_keys", force: true do |t|
    t.string   "access_token"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "custom_queries", force: true do |t|
    t.string   "field"
    t.string   "comparison"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_set_id"
  end

  create_table "customer_sets", force: true do |t|
    t.string   "name"
    t.string   "rule"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "field"
    t.string   "comparison"
    t.integer  "value"
    t.integer  "user_id"
    t.date     "start"
    t.date     "end"
    t.string   "date_comparison"
  end

  create_table "customers", force: true do |t|
    t.text     "custom_data"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "id_on_app"
    t.string   "email"
    t.integer  "set_id"
    t.date     "has_paid"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
  end

  create_table "plans", force: true do |t|
    t.string   "name"
    t.integer  "cost"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plans", ["user_id"], name: "index_plans_on_user_id"

# Could not dump table "users" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

end
