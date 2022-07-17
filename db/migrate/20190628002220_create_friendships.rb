class CreateFriendships < ActiveRecord::Migration[5.1]
  def change
    create_table :friendships do |t|
      t.belongs_to :user, index: true
      t.belongs_to :friend, index: true
      t.timestamps
    end
  end
end
