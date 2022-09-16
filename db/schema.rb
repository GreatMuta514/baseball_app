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

ActiveRecord::Schema.define(version: 2022_09_16_070146) do

  create_table "chatrooms", force: :cascade do |t|
    t.string "thumbnail"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "pro_game_id", null: false
    t.index ["pro_game_id"], name: "index_chatrooms_on_pro_game_id"
  end

  create_table "chats", force: :cascade do |t|
    t.string "body", limit: 100, null: false
    t.integer "user_id", null: false
    t.integer "chatroom_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chatroom_id"], name: "index_chats_on_chatroom_id"
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "email", null: false
    t.integer "subject", default: 0, null: false
    t.text "message", limit: 400, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "highschool_games", force: :cascade do |t|
    t.string "first_side_team"
    t.string "third_side_team"
    t.string "first_side_team_prefecture"
    t.string "third_side_team_prefecture"
    t.integer "first_side_score"
    t.integer "third_side_score"
    t.integer "state"
    t.integer "result"
    t.datetime "start_at"
    t.datetime "finish_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pro_game_predict_comments", force: :cascade do |t|
    t.string "body", limit: 140, null: false
    t.integer "user_id", null: false
    t.integer "pro_game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "parent_id"
    t.index ["parent_id"], name: "index_pro_game_predict_comments_on_parent_id"
    t.index ["pro_game_id"], name: "index_pro_game_predict_comments_on_pro_game_id"
    t.index ["user_id"], name: "index_pro_game_predict_comments_on_user_id"
  end

  create_table "pro_game_predicts", force: :cascade do |t|
    t.integer "first_base_side_score", null: false
    t.integer "third_base_side_score", null: false
    t.integer "user_id", null: false
    t.integer "win_or_lose", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "pro_game_id", null: false
    t.integer "point"
    t.index ["pro_game_id"], name: "index_pro_game_predicts_on_pro_game_id"
    t.index ["user_id"], name: "index_pro_game_predicts_on_user_id"
  end

  create_table "pro_games", force: :cascade do |t|
    t.string "field"
    t.string "first_base_side_pro_team", null: false
    t.string "third_base_side_pro_team", null: false
    t.integer "first_base_side_score"
    t.integer "third_base_side_score"
    t.string "first_base_side_pitcher"
    t.string "third_base_side_pitcher"
    t.integer "result"
    t.datetime "start_at", null: false
    t.datetime "finish_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nickname", limit: 16, null: false
    t.string "profile"
    t.integer "rank", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.integer "role", limit: 1, default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  add_foreign_key "chatrooms", "pro_games"
  add_foreign_key "chats", "chatrooms"
  add_foreign_key "chats", "users"
  add_foreign_key "pro_game_predict_comments", "pro_game_predict_comments", column: "parent_id"
  add_foreign_key "pro_game_predict_comments", "pro_games"
  add_foreign_key "pro_game_predict_comments", "users"
  add_foreign_key "pro_game_predicts", "pro_games"
  add_foreign_key "pro_game_predicts", "users"
end
