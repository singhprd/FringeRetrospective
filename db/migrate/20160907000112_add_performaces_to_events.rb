# frozen_string_literal: true

class AddPerformacesToEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :performances, :event, foreign_key: true
  end
end
