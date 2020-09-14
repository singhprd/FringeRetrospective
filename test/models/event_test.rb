# frozen_string_literal: true

require "test_helper"

class EventTest < ActiveSupport::TestCase
  setup do
    @event = Fabricate(:event)
    @user = Fabricate(:user)
    10.times { Fabricate(:vote, event: @event, user: @user, value: 1) }
    5.times { Fabricate(:vote, event: @event, user: @user, value: -1) }
  end

  test "favourited?" do
    assert_equal(false, Event.favourited?(@user, @event.id))
  end

  test "count upvotes" do
    assert_equal(10, @event.upvotes)
  end

  test "count downvotes" do
    assert_equal(5, @event.downvotes)
  end

  test "tally votes" do
    assert_equal(5, @event.tally_votes)
  end

  test "to_fringebot_hash" do
    result =
      {
        title: @event.title,
        festival: @event.festival,
        year: @event.festival_year,
        artist: @event.artist,
        code: @event.code,
      }
    assert_equal(result, @event.to_fringebot_hash)
  end

  # test "check_for_updates" do
  #   fb = Fringebot.new("uuid" => "a73342c098fe74dee84822ed2916ca9efdf6b1eb")
  #   test_event = fb.single_event
  #   assert_equal("FAKE Schiz", test_event.reload.title)

  #   test_event.update_attributes(title: "A Wrong Title")
  #   assert_equal("A Wrong Title", test_event.reload.title)

  #   test_event.check_for_updates
  #   assert_equal("FAKE Schiz", test_event.reload.title)
  # end

  # test "getting reviews" do
  #   @event.update(title: "Red Bastard: Lie With Me")
  #   @event.get_reviews
  #   assert_equal Review.where(event: @event).count, Event::REVIEW_SOURCES.count
  # end

  # test "check_for_updates" do
  #   @event.update_attributes(code: "832")

  #   assert_equal("823", @event.check_for_updates)
  # end
end
