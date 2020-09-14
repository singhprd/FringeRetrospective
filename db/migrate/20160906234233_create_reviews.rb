# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :url
      t.string :stars
      t.string :title

      t.timestamps
    end
  end
end
