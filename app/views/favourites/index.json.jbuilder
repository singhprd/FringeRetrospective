# frozen_string_literal: true

json.array! @favourites, partial: "favourites/favourite", as: :favourite
