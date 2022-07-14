# frozen_string_literal: true

class CreatePerformances < ActiveRecord::Migration[5.0]
  def change
    create_table :performances do |t|
      t.string :concession
      t.string :price
      t.string :title
      t.string :concession_family
      t.string :concession_additional
      t.string :type
      t.string :duration_minutes
      t.boolean :is_at_fixed_time
      t.string :price_type
      t.string :price_string
      t.datetime :end_time
      t.datetime :start_time
      t.references :image, foreign_key: true
      t.timestamps
    end
  end
end
