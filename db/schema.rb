# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_26_120854) do

  create_table "invoices", force: :cascade do |t|
    t.integer "invoice_number"
    t.integer "pen_number"
    t.integer "quantity"
    t.decimal "tax_kdv", precision: 5, scale: 2
    t.decimal "tax_otv", precision: 5, scale: 2
    t.string "definition"
    t.date "value_date"
    t.decimal "sum", precision: 20, scale: 2
    t.integer "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["invoice_number", "pen_number"], name: "index_invoices_on_invoice_number_and_pen_number", unique: true
    t.index ["product_id"], name: "index_invoices_on_product_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "type"
    t.string "bank"
    t.decimal "comission", precision: 20, scale: 2
    t.integer "sales_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sales_id"], name: "index_payments_on_sales_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "code", null: false
    t.string "definition"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_products_on_code", unique: true
  end

  create_table "sales", force: :cascade do |t|
    t.datetime "date"
    t.integer "product_id", null: false
    t.decimal "return_amount", precision: 20, scale: 2
    t.decimal "buy_price", precision: 20, scale: 2, null: false
    t.decimal "sell_price", precision: 20, scale: 2, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_sales_on_product_id"
  end

  add_foreign_key "invoices", "products"
  add_foreign_key "payments", "sales", column: "sales_id"
  add_foreign_key "sales", "products"
end
