# frozen_string_literal: true

class CreateFavourites < ActiveRecord::Migration[5.0]
  def change
    create_table :favourites do |t|
      t.references :user, foreign_key: true, type: :int
      t.references :event, foreign_key: true, type: :int

      t.timestamps
    end
  end
end
