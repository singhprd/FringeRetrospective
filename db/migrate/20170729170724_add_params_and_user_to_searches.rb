# frozen_string_literal: true

class AddParamsAndUserToSearches < ActiveRecord::Migration[5.1]
  def change
    add_column(:searches, :year, :string, limit: 4)
    add_column(:searches, :festival_string, :string, limit: 25)
    add_column(:searches, :title_string, :string)
    add_column(:searches, :artist, :string)
    add_reference(:searches, :user, foreign_key: true)
  end
end
