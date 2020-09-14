# frozen_string_literal: true

class AddReviewsToEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :event, foreign_key: true
  end
end
