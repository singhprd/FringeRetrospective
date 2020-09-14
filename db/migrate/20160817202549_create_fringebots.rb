# frozen_string_literal: true

class CreateFringebots < ActiveRecord::Migration[5.0]
  def change
    create_table :fringebots, &:timestamps
  end
end
