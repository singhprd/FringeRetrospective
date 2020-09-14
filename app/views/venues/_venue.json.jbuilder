# frozen_string_literal: true

json.extract! venue, :id, :address, :box_office_fringe, :box_office_opening, :cafe_description, :code, :email, :fax, :has_bar, :has_booking_over_card, :has_booking_over_phone, :has_booking_over_web, :has_cafe, :name, :phone, :lat, :lon, :post_code, :web_address, :created_at, :updated_at
json.url venue_url(venue, format: :json)
