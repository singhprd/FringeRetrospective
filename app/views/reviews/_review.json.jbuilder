# frozen_string_literal: true

json.extract! review, :id, :url, :stars, :title, :created_at, :updated_at
json.url review_url(review, format: :json)
