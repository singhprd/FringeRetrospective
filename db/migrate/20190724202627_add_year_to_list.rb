class AddYearToList < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :year, :string, limit: 4
  end
end
