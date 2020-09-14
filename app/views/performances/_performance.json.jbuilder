# frozen_string_literal: true

json.extract! performance, :id, :concession, :end, :price, :start, :created_at, :updated_at
json.url performance_url(performance, format: :json)
