# frozen_string_literal: true

class RenameImageHashColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :images, :hash, :image_hash
  end
end
