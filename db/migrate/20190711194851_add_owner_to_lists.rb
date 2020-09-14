class AddOwnerToLists < ActiveRecord::Migration[5.1]
  def change
    add_reference :lists, :owner, references: :users, index: true
  end
end
