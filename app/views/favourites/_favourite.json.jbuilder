# frozen_string_literal: true

json.extract! favourite, :id, :user_id, :event_id, :created_at, :updated_at
json.url favourite_url(favourite, format: :json)
