# frozen_string_literal: true

class CreateImageVersions < ActiveRecord::Migration[5.0]
  def change
    create_table :image_versions do |t|
      t.string :description
      t.string :height
      t.string :mime
      t.string :type
      t.string :url
      t.string :width

      t.timestamps
    end
  end
end
