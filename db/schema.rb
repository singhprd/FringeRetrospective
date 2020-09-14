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

ActiveRecord::Schema.define(version: 20190724202627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comment_votes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "comment_id"
    t.integer "vote"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_comment_votes_on_comment_id"
    t.index ["user_id"], name: "index_comment_votes_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.text "text"
    t.integer "in_reply_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_comments_on_event_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "credentials", force: :cascade do |t|
    t.string "external_id"
    t.string "public_key"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.index ["user_id"], name: "index_credentials_on_user_id"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.string "age_category"
    t.string "artist"
    t.string "code"
    t.string "description"
    t.string "festival"
    t.string "festival_id"
    t.string "genre"
    t.string "latitude"
    t.string "longitude"
    t.string "status"
    t.string "title"
    t.string "updated"
    t.string "url"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "score", default: 0
    t.integer "venue_id"
    t.string "festival_year"
    t.string "last_checked_for_update"
    t.datetime "performances_last_updated"
    t.index ["venue_id"], name: "index_events_on_venue_id"
  end

  create_table "events_searches", id: false, force: :cascade do |t|
    t.bigint "search_id", null: false
    t.bigint "event_id", null: false
  end

  create_table "favourites", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_favourites_on_event_id"
    t.index ["user_id", "event_id"], name: "index_favourites_on_user_id_and_event_id", unique: true
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "friend_requests", force: :cascade do |t|
    t.bigint "sender_id"
    t.bigint "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_friend_requests_on_recipient_id"
    t.index ["sender_id"], name: "index_friend_requests_on_sender_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "fringebots", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "image_versions", id: :serial, force: :cascade do |t|
    t.string "description"
    t.string "height"
    t.string "mime"
    t.string "image_type"
    t.string "url"
    t.string "width"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "image_id"
    t.index ["image_id"], name: "index_image_versions_on_image_id"
  end

  create_table "images", id: :serial, force: :cascade do |t|
    t.string "image_hash"
    t.string "image_type"
    t.string "orientation"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_images_on_event_id"
  end

  create_table "list_items", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "list_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_list_items_on_event_id"
    t.index ["list_id"], name: "index_list_items_on_list_id"
  end

  create_table "lists", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.bigint "owner_id"
    t.string "year", limit: 4
    t.index ["owner_id"], name: "index_lists_on_owner_id"
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "lists_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "list_id", null: false
    t.index ["list_id", "user_id"], name: "index_lists_users_on_list_id_and_user_id"
    t.index ["user_id", "list_id"], name: "index_lists_users_on_user_id_and_list_id"
  end

  create_table "performances", id: :serial, force: :cascade do |t|
    t.string "concession"
    t.string "end_time"
    t.string "price"
    t.string "start_time"
    t.integer "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_id"
    t.string "concession_additional"
    t.string "concession_family"
    t.string "title"
    t.index ["event_id"], name: "index_performances_on_event_id"
    t.index ["image_id"], name: "index_performances_on_image_id"
  end

  create_table "reviews", id: :serial, force: :cascade do |t|
    t.string "url"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_id"
    t.string "content"
    t.string "search_engine_content"
    t.string "source"
    t.boolean "has_data"
    t.index ["event_id"], name: "index_reviews_on_event_id"
  end

  create_table "searches", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "year", limit: 4
    t.string "festival_string", limit: 25
    t.string "title_string"
    t.string "artist"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_searches_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "votes_left", default: 100
    t.integer "vote_reset_amount", default: 10
    t.string "username"
    t.boolean "admin", default: false
    t.string "current_challenge"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.string "provider"
    t.string "uid"
    t.string "token"
    t.integer "expires_at"
    t.boolean "expires"
    t.string "refresh_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "venues", id: :serial, force: :cascade do |t|
    t.string "address"
    t.boolean "box_office_fringe"
    t.string "box_office_opening"
    t.string "cafe_description"
    t.string "code"
    t.string "email"
    t.string "fax"
    t.boolean "has_bar"
    t.boolean "has_booking_over_card"
    t.boolean "has_booking_over_phone"
    t.boolean "has_booking_over_web"
    t.boolean "has_cafe"
    t.string "name"
    t.string "phone"
    t.string "lat"
    t.string "lon"
    t.string "post_code"
    t.string "web_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "position"
    t.string "description"
    t.string "disabled_description"
  end

  create_table "votes", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_votes_on_event_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "comment_votes", "comments"
  add_foreign_key "comment_votes", "users"
  add_foreign_key "comments", "events"
  add_foreign_key "comments", "users"
  add_foreign_key "events", "venues"
  add_foreign_key "favourites", "events"
  add_foreign_key "favourites", "users"
  add_foreign_key "friendships", "users"
  add_foreign_key "friendships", "users", column: "friend_id"
  add_foreign_key "image_versions", "images"
  add_foreign_key "images", "events"
  add_foreign_key "list_items", "events"
  add_foreign_key "list_items", "lists"
  add_foreign_key "lists", "users"
  add_foreign_key "performances", "events"
  add_foreign_key "performances", "images"
  add_foreign_key "reviews", "events"
  add_foreign_key "searches", "users"
  add_foreign_key "votes", "events"
  add_foreign_key "votes", "users"
end
