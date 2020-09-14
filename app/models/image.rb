# frozen_string_literal: true

class Image < ApplicationRecord
  has_many :image_versions, dependent: :destroy
  belongs_to :event
end
