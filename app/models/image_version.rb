# frozen_string_literal: true

class ImageVersion < ApplicationRecord
  belongs_to :image

  def remote_url
    "https:" + url
  end
end
