# frozen_string_literal: true

class RemoveStarsFromReviews < ActiveRecord::Migration[5.0]
  def change
    remove_column :reviews, :stars
  end
end
