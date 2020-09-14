# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :skip_password_validation
  # after_initialize :set_default_votes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :votes
  has_many :favourites
  has_many :searches

  has_and_belongs_to_many :lists
  # has_many :lists, foreign_key: :owner_id

  # has_many :lists, through: :list_contributions

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :sent_friend_requests, :class_name => 'FriendRequest', :foreign_key => 'sender_id'
  has_many :pending_friend_requests, :class_name => 'FriendRequest', :foreign_key => 'recipient_id'
  has_many :credentials, dependent: :destroy
  # validates_uniqueness_of :username, :unless => :unregistered?

  devise :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.from_omniauth(auth)
    # Either create a User record or update it based on the provider (Google) and the UID
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.token = auth.credentials.token
      user.expires = auth.credentials.expires
      user.expires_at = auth.credentials.expires_at
      user.refresh_token = auth.credentials.refresh_token
      user.email = auth.extra.id_info.email
      user.skip_password_validation = true
    end
  end

  def reduce_votes_left
    current_votes = votes_left
    return false if current_votes <= 0

    update_attributes(votes_left: (current_votes - 1))
  end

  def reset_votes
    @amount = vote_reset_amount + votes_left
    self.votes_left = @amount
    puts save!
  end

  def set_default_votes
    update(votes_left: 100)
  end

  def self.replenish_votes
    User.all.each(&:reset_votes)
  end

  def unregistered?
    password.blank?
  end

  def friends_with?(friend)
    Friendship.exists?(user: self, friend: friend)
  end

  def send_invite_email!
    UserInviteMailer.with(user: self).weekly_summary.deliver_now
  end

  protected

  def password_required?
    return false if skip_password_validation
    super
  end
end
