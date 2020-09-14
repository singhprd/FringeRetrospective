# frozen_string_literal: true

class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :event
  # after_save :update_event_score

  def update_event_score
    event.tally_votes
  end
end
