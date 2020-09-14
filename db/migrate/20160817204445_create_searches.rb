# frozen_string_literal: true

class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches, &:timestamps
  end
end
