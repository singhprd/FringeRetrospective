# frozen_string_literal: true

json.array! @venues, partial: "venues/venue", as: :venue
