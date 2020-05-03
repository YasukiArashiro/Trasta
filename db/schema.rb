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

ActiveRecord::Schema.define(version: 2020_05_02_133607) do

  create_table "evaluations", force: :cascade do |t|
    t.integer "user_id"
    t.string "evaluation"
    t.text "evaluation_comment"
    t.boolean "evaluation_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "match_styles", force: :cascade do |t|
    t.string "match_style"
    t.boolean "match_style_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "tcg_tag_id"
    t.integer "match_style_id"
    t.integer "opponent_user_id"
    t.string "request_title"
    t.date "match_day"
    t.time "meeting_time"
    t.time "ending_time"
    t.string "prefectures"
    t.string "meeting_place"
    t.text "request_comment"
    t.string "request_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tcg_genres", force: :cascade do |t|
    t.integer "user_id"
    t.integer "tcg_tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tcg_tags", force: :cascade do |t|
    t.string "tcg_name"
    t.boolean "tcg_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nickname"
    t.string "first_name"
    t.string "last_name"
    t.integer "phone_number"
    t.text "profile_image_id"
    t.text "introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tcg_tag_id"
    t.integer "match_style_id", default: 1
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
