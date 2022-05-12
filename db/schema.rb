# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_05_083517) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apartments", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.text "description"
    t.boolean "rental", default: false
    t.text "image1"
    t.text "image2"
    t.text "image3"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "favourite", default: false
    t.integer "rental_price", default: 0
    t.integer "house_price", default: 0
    t.integer "period", default: 0
    t.index ["user_id"], name: "index_apartments_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "apartment_id", null: false
    t.index ["apartment_id"], name: "index_bookings_on_apartment_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "markets", force: :cascade do |t|
    t.integer "price", default: 0
    t.bigint "apartment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apartment_id"], name: "index_markets_on_apartment_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.integer "price", default: 0
    t.integer "period", default: 0
    t.bigint "apartment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apartment_id"], name: "index_rentals_on_apartment_id"
  end

  create_table "user_apartments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "apartment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apartment_id"], name: "index_user_apartments_on_apartment_id"
    t.index ["user_id"], name: "index_user_apartments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "apartments", "users"
  add_foreign_key "bookings", "markets", column: "apartment_id"
  add_foreign_key "bookings", "rentals", column: "apartment_id"
  add_foreign_key "bookings", "user_apartments", column: "user_id"
  add_foreign_key "markets", "apartments"
  add_foreign_key "rentals", "apartments"
  add_foreign_key "user_apartments", "apartments"
  add_foreign_key "user_apartments", "users"
end
