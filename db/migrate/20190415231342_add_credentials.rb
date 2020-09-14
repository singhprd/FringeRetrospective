class AddCredentials < ActiveRecord::Migration[5.1]
  def change
    create_table "credentials", force: :cascade do |t|
      t.string "external_id"
      t.string "public_key"
      t.bigint "user_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "nickname"
      t.index ["user_id"], name: "index_credentials_on_user_id"
    end
  end
end
