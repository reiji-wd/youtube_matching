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

ActiveRecord::Schema.define(version: 2020_09_07_024025) do

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_favorites_on_post_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "friendrequests", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "friend_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["friend_id"], name: "index_friendrequests_on_friend_id"
    t.index ["user_id", "friend_id"], name: "index_friendrequests_on_user_id_and_friend_id", unique: true
    t.index ["user_id"], name: "index_friendrequests_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "youtuber_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_likes_on_user_id"
    t.index ["youtuber_id"], name: "index_likes_on_youtuber_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.string "image"
    t.integer "user_id", null: false
    t.integer "room_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "check"
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notices", force: :cascade do |t|
    t.integer "reciever_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "content"
    t.string "check"
    t.integer "sender_id", null: false
    t.index ["reciever_id"], name: "index_notices_on_reciever_id"
    t.index ["sender_id"], name: "index_notices_on_sender_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "content"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "friend_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["friend_id"], name: "index_relationships_on_friend_id"
    t.index ["user_id", "friend_id"], name: "index_relationships_on_user_id_and_friend_id", unique: true
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.integer "friend_id", null: false
    t.index ["friend_id"], name: "index_rooms_on_friend_id"
    t.index ["user_id", "friend_id"], name: "index_rooms_on_user_id_and_friend_id", unique: true
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_id"
    t.string "icon"
  end

  create_table "youtubers", force: :cascade do |t|
    t.string "channel_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.string "icon"
    t.integer "subscribers"
  end

  add_foreign_key "favorites", "posts"
  add_foreign_key "favorites", "users"
  add_foreign_key "friendrequests", "users"
  add_foreign_key "friendrequests", "users", column: "friend_id"
  add_foreign_key "likes", "users"
  add_foreign_key "likes", "youtubers"
  add_foreign_key "messages", "rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "notices", "users", column: "reciever_id"
  add_foreign_key "notices", "users", column: "sender_id"
  add_foreign_key "posts", "users"
  add_foreign_key "relationships", "users"
  add_foreign_key "relationships", "users", column: "friend_id"
  add_foreign_key "rooms", "users"
  add_foreign_key "rooms", "users", column: "friend_id"
end
