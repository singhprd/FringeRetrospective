# frozen_string_literal: true

api = FestivalsLab.new("xxAPIAccessKeyxx", "xxAPISecretKeyxxxxAPISecretKeyxx")

api.events # The first page of events (using the API's default of 25 per page)

api.events(festival: "book", size: 50, from: 100)

api.events(festival: "fringe", post_code: "EH1", price_to: 5)
