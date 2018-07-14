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

ActiveRecord::Schema.define(version: 2018_07_10_185758) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "skus", force: :cascade do |t|
    t.string "sku_code", null: false
    t.string "supplier_code", null: false
    t.string "name", null: false
    t.float "price", null: false
    t.string "extra_attribute"
    t.string "extra_attribute_2"
    t.string "extra_attribute_3"
    t.string "extra_attribute_4"
    t.string "extra_attribute_5"
    t.bigint "supplier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplier_code"], name: "index_skus_on_supplier_code"
    t.index ["supplier_id"], name: "index_skus_on_supplier_id"
  end

  create_table "suppliers", primary_key: "code", id: :string, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_suppliers_on_code"
  end

end
