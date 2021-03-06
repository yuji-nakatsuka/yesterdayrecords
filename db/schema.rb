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

ActiveRecord::Schema.define(version: 2019_08_27_043908) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "artists", force: :cascade do |t|
    t.string "artist", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist"], name: "index_artists_on_artist", unique: true
  end

  create_table "carts", force: :cascade do |t|
    t.integer "end_user_id", null: false
    t.integer "sell_cd_id", null: false
    t.integer "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_addresses", force: :cascade do |t|
    t.integer "end_user_id", null: false
    t.string "zip", null: false
    t.text "delivery_address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discs", force: :cascade do |t|
    t.integer "sell_cd_id", null: false
    t.integer "number", null: false
    t.string "disc", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "end_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "password", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "kana_last", default: "", null: false
    t.string "kana_first", default: "", null: false
    t.string "zip", default: "", null: false
    t.text "address", default: "", null: false
    t.string "phone_number", default: "", null: false
    t.string "deleted_at", default: "", null: false
    t.index ["email"], name: "index_end_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_end_users_on_reset_password_token", unique: true
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "end_user_id"
    t.integer "sell_cd_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "genre", null: false
    t.index ["genre"], name: "index_genres_on_genre", unique: true
  end

  create_table "labels", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "label", null: false
    t.index ["label"], name: "index_labels_on_label", unique: true
  end

  create_table "order_contents", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "sell_cd_id", null: false
    t.integer "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "end_user_id", null: false
    t.integer "total_price", null: false
    t.integer "payment_method", null: false
    t.string "zip", null: false
    t.text "delivery_address", null: false
    t.integer "delivery_status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sell_cd_images", force: :cascade do |t|
    t.integer "sell_cd_id"
    t.text "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sell_cds", force: :cascade do |t|
    t.integer "label_id", null: false
    t.integer "genre_id", null: false
    t.integer "artist_id", null: false
    t.string "title", null: false
    t.integer "value", null: false
    t.text "image_id"
    t.integer "sell_status", null: false
    t.integer "stock", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_sell_cds_on_title"
  end

  create_table "songs", force: :cascade do |t|
    t.integer "disc_id", null: false
    t.integer "number", null: false
    t.string "song", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
