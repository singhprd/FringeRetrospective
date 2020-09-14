# frozen_string_literal: true

class AddImageForeignKeyToImageVersion < ActiveRecord::Migration[5.0]
  def change
    add_reference :image_versions, :image, foreign_key: true
  end
end
