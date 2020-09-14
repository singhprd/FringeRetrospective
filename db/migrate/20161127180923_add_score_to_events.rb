# frozen_string_literal: true

class AddScoreToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column(:events, :score, :integer, default: 0)
  end
end
