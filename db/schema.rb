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

ActiveRecord::Schema.define(version: 20171103130917) do

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

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id", "product_id"], name: "index_order_items_on_order_id_and_product_id", unique: true
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "buyer_id"
    t.string "charge_identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_orders_on_buyer_id"
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "product_id"
    t.string "image_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_photos_on_product_id"
  end

  create_table "product_views", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "buyer_id"
    t.index ["buyer_id"], name: "index_product_views_on_buyer_id"
    t.index ["product_id", "buyer_id"], name: "index_product_views_on_product_id_and_buyer_id", unique: true
    t.index ["product_id"], name: "index_product_views_on_product_id"
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
    t.string "postage"
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

  create_table "reviews", force: :cascade do |t|
    t.bigint "seller_id"
    t.bigint "buyer_id"
    t.text "comment"
    t.decimal "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_reviews_on_buyer_id"
    t.index ["seller_id"], name: "index_reviews_on_seller_id"
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.bigint "buyer_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id", "product_id"], name: "index_shopping_carts_on_buyer_id_and_product_id", unique: true
    t.index ["buyer_id"], name: "index_shopping_carts_on_buyer_id"
    t.index ["product_id"], name: "index_shopping_carts_on_product_id"
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

  create_table "watchlists", force: :cascade do |t|
    t.bigint "buyer_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id", "product_id"], name: "index_watchlists_on_buyer_id_and_product_id", unique: true
    t.index ["buyer_id"], name: "index_watchlists_on_buyer_id"
    t.index ["product_id"], name: "index_watchlists_on_product_id"
  end

  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "users", column: "buyer_id"
  add_foreign_key "photos", "products"
  add_foreign_key "product_views", "products"
  add_foreign_key "product_views", "users", column: "buyer_id"
  add_foreign_key "products", "users", column: "seller_id"
  add_foreign_key "profiles", "users"
  add_foreign_key "reviews", "users", column: "buyer_id"
  add_foreign_key "reviews", "users", column: "seller_id"
  add_foreign_key "shopping_carts", "products"
  add_foreign_key "shopping_carts", "users", column: "buyer_id"
  add_foreign_key "watchlists", "products"
  add_foreign_key "watchlists", "users", column: "buyer_id"
end
