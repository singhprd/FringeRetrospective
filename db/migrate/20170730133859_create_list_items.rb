# frozen_string_literal: true

class CreateListItems < ActiveRecord::Migration[5.1]
  def change
    create_table :list_items do |t|
      t.belongs_to :event
      t.belongs_to :list
      t.integer :position
      t.timestamps
    end
  end
end
