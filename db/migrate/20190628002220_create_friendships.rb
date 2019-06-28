class CreateFriendships < ActiveRecord::Migration[5.1]
  def change
    create_table :friendships do |t|
      t.references :user, index: true, foreign_key: true
      t.references :friend, index: true, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
