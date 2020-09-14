# frozen_string_literal: true

class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def self.easy_find(opts)
    user = User.find(opts[:user_id]) if opts[:user_id]
    event = Event.find(opts[:event_id]) if opts[:event_id]

    return user.favourites.where(event_id: event.id).first if user && event
    return user.favourites if user
    return event.favourites if event
  end
end
