# frozen_string_literal: true

json.extract!(event,
              :id,
              :age_category,
              :artist,
              :code,
              :description,
              :festival,
              :festival_id,
              :genre,
              :latitude,
              :longitude,
              :status,
              :title,
              :updated,
              :url,
              :website,
              :created_at,
              :updated_at,
              :score,
              :venue_id,
              :festival_year,
              :last_checked_for_update,
              :performances_last_updated,
              :venue)

# json.merge!(image_urls: event.image_urls)
# json.merge!(favourited: result = Event.favourited?(current_user, params[:event_id])) if !current_user.nil?
# json.url event_url(event, format: :json)
