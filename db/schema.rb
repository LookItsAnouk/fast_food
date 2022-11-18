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

ActiveRecord::Schema[7.0].define(version: 2022_11_18_045212) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cooks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cooks_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "payment_type"
    t.string "delivery_type"
    t.datetime "delivery_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "recipe_id", null: false
    t.boolean "pending?"
    t.boolean "approved?"
    t.index ["recipe_id"], name: "index_orders_on_recipe_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "rating"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cooks_id", null: false
    t.index ["cooks_id"], name: "index_ratings_on_cooks_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "ingredients"
    t.text "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "price"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.boolean "pending?"
    t.boolean "approved?"
    t.bigint "user_id", null: false
    t.bigint "recipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "body"
    t.index ["recipe_id"], name: "index_reviews_on_recipe_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "address"
    t.string "phone"
    t.boolean "is_cook?"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cooks", "users"
  add_foreign_key "orders", "recipes"
  add_foreign_key "orders", "users"
  add_foreign_key "ratings", "cooks", column: "cooks_id"
  add_foreign_key "ratings", "users"
  add_foreign_key "recipes", "users"
  add_foreign_key "reviews", "recipes"
  add_foreign_key "reviews", "users"
end
