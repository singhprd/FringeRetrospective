# frozen_string_literal: true

class CreateVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :venues do |t|
      t.string :address
      t.boolean :box_office_fringe
      t.string :box_office_opening
      t.string :cafe_description
      t.string :code
      t.string :email
      t.string :fax
      t.boolean :has_bar
      t.boolean :has_booking_over_card
      t.boolean :has_booking_over_phone
      t.boolean :has_booking_over_web
      t.boolean :has_cafe
      t.string :name
      t.string :phone
      t.string :lat
      t.string :lon
      t.string :post_code
      t.string :web_address
      t.timestamps
    end
  end
end
