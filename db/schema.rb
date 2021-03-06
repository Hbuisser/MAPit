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

ActiveRecord::Schema.define(version: 2019_06_11_075538) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "background_images", force: :cascade do |t|
    t.string "photo"
    t.string "letter"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_background_images_on_user_id"
  end

  create_table "course_words", force: :cascade do |t|
    t.string "word"
    t.string "translation"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_words_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
  end

  create_table "subscription_words", force: :cascade do |t|
    t.string "photo_target_word"
    t.string "photo_mother_tongue"
    t.boolean "mapped", default: false
    t.boolean "flashed", default: false
    t.bigint "subscription_id"
    t.bigint "course_word_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "photo_mother_tongue_x"
    t.integer "photo_mother_tongue_y"
    t.integer "photo_target_word_x"
    t.integer "photo_target_word_y"
    t.bigint "background_image_id"
    t.index ["background_image_id"], name: "index_subscription_words_on_background_image_id"
    t.index ["course_word_id"], name: "index_subscription_words_on_course_word_id"
    t.index ["subscription_id"], name: "index_subscription_words_on_subscription_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_subscriptions_on_course_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "background_images", "users"
  add_foreign_key "course_words", "courses"
  add_foreign_key "subscription_words", "background_images"
  add_foreign_key "subscription_words", "course_words"
  add_foreign_key "subscription_words", "subscriptions"
  add_foreign_key "subscriptions", "courses"
  add_foreign_key "subscriptions", "users"
end
