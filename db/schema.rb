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

ActiveRecord::Schema.define(version: 20160518082930) do

  create_table "customers", force: :cascade do |t|
    t.string   "fname",      limit: 255
    t.string   "lname",      limit: 255
    t.string   "street",     limit: 255
    t.string   "city",       limit: 255
    t.string   "state",      limit: 255
    t.string   "zip",        limit: 255
    t.string   "phone",      limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "order_id",   limit: 4
    t.integer  "menu_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "quantity",   limit: 4
  end

  add_index "items", ["menu_id"], name: "index_items_on_menu_id", using: :btree
  add_index "items", ["order_id"], name: "index_items_on_order_id", using: :btree

  create_table "menus", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.float    "price",      limit: 24
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id",  limit: 4
    t.text     "order_detail", limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "item_id",      limit: 4
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree
  add_index "orders", ["item_id"], name: "index_orders_on_item_id", using: :btree

  create_table "reservations", force: :cascade do |t|
    t.integer  "customer_id", limit: 4
    t.date     "date"
    t.time     "time"
    t.integer  "party",       limit: 4
    t.text     "request",     limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "reservations", ["customer_id"], name: "index_reservations_on_customer_id", using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "street",     limit: 255
    t.string   "city",       limit: 255
    t.string   "state",      limit: 255
    t.string   "zip",        limit: 255
    t.string   "phone",      limit: 255
    t.string   "website",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "items", "menus"
  add_foreign_key "items", "orders"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "items"
  add_foreign_key "reservations", "customers"
end
