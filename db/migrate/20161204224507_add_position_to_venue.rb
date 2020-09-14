# frozen_string_literal: true

class AddPositionToVenue < ActiveRecord::Migration[5.0]
  def change
    add_column(:venues, :position, :string)
  end
end
