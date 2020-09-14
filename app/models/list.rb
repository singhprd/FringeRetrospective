# frozen_string_literal: true

class List < ApplicationRecord
  has_many :list_items, -> { order(position: :asc) }, dependent: :destroy
  has_many :events, through: :list_items
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"

  validates_length_of :name, minimum: 1
  validates_inclusion_of :year, in: Fringebot::YEARS

  scope :for_year, ->(year) { where(year: year) }

  # validates :year, inclusion: { in: Fringebot::YEARS,
    # message: "%{value} is not a valid year" }

  has_and_belongs_to_many :users

  # belongs_to :user

  def user_has_access?(user)
    users.include?(user)
  end

  def add_user(user, current_user)
    return false if user == current_user

    users << user
  end

  def remove_user(user, current_user)
    return false if user == current_user
    return false unless current_user == owner

    users.delete(user)
  end
end
