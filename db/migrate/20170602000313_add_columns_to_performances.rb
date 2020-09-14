# frozen_string_literal: true

class AddColumnsToPerformances < ActiveRecord::Migration[5.0]
  def change
    add_column(:performances, :concession_additional, :string)
    add_column(:performances, :concession_family, :string)
    add_column(:performances, :title, :string)
  end
end
