# frozen_string_literal: true

class ChangePerformanceColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :performances, :end, :end_time
    rename_column :performances, :start, :start_time
  end
end
