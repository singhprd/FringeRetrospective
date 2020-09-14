class CreateFriendRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :friend_requests do |t|
      t.references :sender
      t.references :recipient
      t.timestamps
    end
  end
end
