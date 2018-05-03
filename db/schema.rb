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

ActiveRecord::Schema.define(version: 2018_05_01_161240) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accounts_users", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "user_id"
    t.index ["account_id"], name: "index_accounts_users_on_account_id"
    t.index ["user_id"], name: "index_accounts_users_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "payer_id"
    t.bigint "account_id"
    t.datetime "paid_at", null: false
    t.decimal "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_expenses_on_account_id"
    t.index ["category_id"], name: "index_expenses_on_category_id"
    t.index ["payer_id"], name: "index_expenses_on_payer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name"
    t.string "password_digest", null: false
    t.string "auth_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "users_expenses", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "expense_id"
    t.decimal "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_id"], name: "index_users_expenses_on_expense_id"
    t.index ["user_id"], name: "index_users_expenses_on_user_id"
  end

  add_foreign_key "accounts_users", "accounts"
  add_foreign_key "accounts_users", "users"
  add_foreign_key "expenses", "accounts"
  add_foreign_key "expenses", "categories"
  add_foreign_key "expenses", "users", column: "payer_id"
  add_foreign_key "users_expenses", "expenses"
  add_foreign_key "users_expenses", "users"
end
