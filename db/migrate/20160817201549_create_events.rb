# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :age_category
      t.string :artist
      t.string :code
      t.string :description
      t.string :festival
      t.string :festival_id
      t.string :genre
      t.string :latitude
      t.string :longitude
      t.string :status
      t.string :title
      t.string :updated
      t.string :url
      t.string :code
      t.string :description
      t.string :website

      t.timestamps
    end
  end
end
