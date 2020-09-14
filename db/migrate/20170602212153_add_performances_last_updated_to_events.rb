# frozen_string_literal: true

class AddPerformancesLastUpdatedToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column(:events, :performances_last_updated, :datetime)
  end
end
