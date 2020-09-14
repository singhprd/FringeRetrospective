# frozen_string_literal: true

require "test_helper"

# TODO: Give example hashes for each type
class FringebotTest < ActiveSupport::TestCase
  setup do
    # params = {"title_string"=>"", "artist"=>"", "year"=>"2016", "festival_string"=>"book"}
    # @fringebot = Fringebot.new(params)
    # @api_response = @fringebot.query_api
    # @results = @fringebot.get_events
  end

  test "will create image and image versions for event" do
    uuid = "53cf9187f2f00583d9b4005f66ba75eddc3169ae"
    fb = Fringebot.new("uuid" => uuid, "year" => "2016")
    event = fb.single_event
  end
end
