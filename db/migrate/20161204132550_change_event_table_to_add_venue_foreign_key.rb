# frozen_string_literal: true

class ChangeEventTableToAddVenueForeignKey < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :venue, foreign_key: true
  end
end
