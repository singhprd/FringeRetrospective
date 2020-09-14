# frozen_string_literal: true

class Search < ApplicationRecord
  has_and_belongs_to_many :events
  belongs_to :user

  def initialize(params_hash, _user)
    super()
    persist_params(params_hash)
    search_with_fringebot
    save!
  end

  def persist_params(params_hash)
    self.festival_string = params_hash["festival_string"]
    self.title_string = params_hash["title_string"]
    self.artist = params_hash["artist"]
    self.year = params_hash["year"]
  end

  def retrieve_params()

    params_hash = Hash.new

    params_hash["festival_string"] = self.festival_string
    params_hash["title_string"] = self.title_string
    params_hash["artist"] = self.artist
    params_hash["year"] = self.year
    return params_hash

  end

  def already_searched_recently
    Search.where(
      festival_string: festival_string,
      title_string: title_string,
      year: year,
      artist: artist,
    ).where(
      "created_at > ?", 1.days.ago
    ).limit(10_000).last
  end

  def search_with_fringebot
    if already_searched_recently.present?
      self.events = already_searched_recently.events
    else
      fringebot = Fringebot.new(retrieve_params)
      self.events = fringebot.get_events
    end
  end
end
