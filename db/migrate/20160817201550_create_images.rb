# frozen_string_literal: true

class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :hash
      t.string :type
      t.string :orientation
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
