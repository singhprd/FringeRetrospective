# frozen_string_literal: true

class ChangeTypeToImageType < ActiveRecord::Migration[5.0]
  def change
    rename_column :images, :type, :image_type
    rename_column :image_versions, :type, :image_type
  end
end
