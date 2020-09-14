# frozen_string_literal: true

json.extract! list, :id, :user_id, :created_at, :updated_at, :name, :event_ids
json.url list_url(list, format: :json)
