class RemoveUniqueConstraintOnUsername < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :username, :string, unique: false
    remove_index :users, :username
  end
end
