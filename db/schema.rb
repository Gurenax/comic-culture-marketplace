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

ActiveRecord::Schema.define(version: 20171101231449) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "house_number"
    t.string "street_name"
    t.string "town_suburb"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "country_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "product_id"
    t.string "image_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_photos_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "seller_id"
    t.string "name"
    t.decimal "price"
    t.text "description"
    t.string "condition"
    t.string "status"
    t.string "category"
    t.string "manufacturer"
    t.string "publisher"
    t.date "publish_date"
    t.string "author"
    t.string "illustrator"
    t.string "isbn_10"
    t.string "isbn_13"
    t.string "dimensions"
    t.decimal "weight"
    t.string "keywords"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seller_id", "name"], name: "index_products_on_seller_id_and_name", unique: true
    t.index ["seller_id"], name: "index_products_on_seller_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name"
    t.string "last_name"
    t.string "image_data"
    t.date "date_of_birth"
    t.text "short_bio"
    t.string "superpowers"
    t.string "favourites"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "billing_address_id"
    t.integer "shipping_address_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "photos", "products"
  add_foreign_key "products", "users", column: "seller_id"
  add_foreign_key "profiles", "users"
end
