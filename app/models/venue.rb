# frozen_string_literal: true

require "securerandom"

class Venue < ApplicationRecord
  validates :code, presence: true, uniqueness: true
  has_many :events

  # def self.clean(my_hash)
  #   raise my_hash
  #   a = JSON.parse!(my_hash)
  #   eval my_hash
  #   to_return = my_hash
  # end
end
