class Event < ApplicationRecord
  has_many :performances, :dependent => :destroy
  has_many :reviews, :dependent => :destroy
  has_many :votes, :dependent => :destroy
  has_many :favourites, :dependent => :destroy
  has_many :images, :dependent => :destroy
  belongs_to :venue
  validates :code, presence: true, uniqueness: true
  validates :festival_year, presence: true
  has_and_belongs_to_many :searches
  has_many :list_items
  has_many :lists, :through => :list_items

  attr_accessor :user

  def upvotes
    votes.where(value: 1).count
  end

  def downvotes
    votes.where(value: -1).count
  end

  def tally_votes
    return 0 if !self.persisted?
    self.score = upvotes - downvotes
    save
    return self.reload.score
  end

  def card_json(current_user)
    @user = current_user
    return self.to_json(
      include: :venue,
      methods: [:favourited, :image_urls]
    )
  end

  def favourited
    return false if @user.nil?

    self.favourites.exists?(
      user_id: @user.id, event_id: self.id
    )
  end

  def self.favourited?(user, event_id)
    return false if user.nil? || event_id.nil?
    Event.find(event_id).favourites.exists?(
      user_id: user.id, event_id: event_id
    )
  end

  def uuid
    url.split("/").last
  end

  def to_fringebot_hash
    {
      title: title,
      festival: festival,
      year: festival_year,
      artist: artist,
      code: code
    }
  end

  def performances_json
    if performances_last_updated&.to_datetime.to_i > 1.hour.ago.to_i
      performances.order(:start_time)
    else
      performances.destroy_all
      update_attributes(performances_last_updated: DateTime.now)
      fringebot = Fringebot.new("uuid" => uuid)
      performances = fringebot.performances(id)
      performances
    end
  end

  def check_for_updates
    # TODO: ADD CHECK TO RETURN IF CHECKED IN LAST X HOURS
    return if last_checked_for_update&.to_datetime.to_i > 1.hour.ago.to_i
    update_attributes(last_checked_for_update: DateTime.now)
    # return if self.last_checked_for_update
    fringebot = Fringebot.new("uuid" => uuid)
    fringebot.single_event
  end

  def image_urls
    images.map do |image|
      image.image_versions.first.remote_url
    end
  end

  # TODO: Add year to event and scope search.
  # def self.year(year)
  #   Event.where(year)
  # end
end
