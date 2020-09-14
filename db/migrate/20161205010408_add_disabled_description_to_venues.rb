# frozen_string_literal: true

class AddDisabledDescriptionToVenues < ActiveRecord::Migration[5.0]
  def change
    add_column(:venues, :disabled_description, :string)
  end
end
