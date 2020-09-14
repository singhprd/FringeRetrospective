# frozen_string_literal: true

class AddFieldsToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column(:reviews, :content, :string)
    add_column(:reviews, :search_engine_content, :string)
    add_column(:reviews, :source, :string)
  end
end
