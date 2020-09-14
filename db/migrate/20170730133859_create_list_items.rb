# frozen_string_literal: true

class CreateListItems < ActiveRecord::Migration[5.1]
  def change
    create_table :list_items do |t|
      t.references :event, foreign_key: true
      t.references :list, foreign_key: true
      t.integer :position
      t.timestamps
    end
  end
end
