# frozen_string_literal: true

class ConvertPerformanceTimesToStrings < ActiveRecord::Migration[5.0]
  def change
    change_column :performances, :start_time, :string
    change_column :performances, :end_time, :string
  end
end
