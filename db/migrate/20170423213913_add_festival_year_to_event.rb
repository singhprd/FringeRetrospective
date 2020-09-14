# frozen_string_literal: true

class AddFestivalYearToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column(:events, :festival_year, :string)
  end
end
