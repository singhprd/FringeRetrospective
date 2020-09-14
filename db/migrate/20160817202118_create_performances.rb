# frozen_string_literal: true

class CreatePerformances < ActiveRecord::Migration[5.0]
  def change
    create_table :performances do |t|
      t.string :concession
      t.datetime :end
      t.string :price
      t.datetime :start
      t.references :image, foreign_key: true

      t.timestamps
    end
  end
end
