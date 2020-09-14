# frozen_string_literal: true

json.extract! vote, :id, :user_id, :event_id, :value, :created_at, :updated_at
json.url vote_url(vote, format: :json)
