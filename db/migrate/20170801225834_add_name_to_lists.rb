# frozen_string_literal: true

class AddNameToLists < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :name, :string
  end
end
