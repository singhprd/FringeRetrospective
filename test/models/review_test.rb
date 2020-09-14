# frozen_string_literal: true

require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  setup do
    @event = Fabricate(:event)
    @user = Fabricate(:user)
    10.times { Fabricate(:vote, event: @event, user: @user, value: 1) }
    5.times { Fabricate(:vote, event: @event, user: @user, value: -1) }
  end

  test "query_bing_for_review" do
    source = "broadwaybaby.com/shows"
    @event.update(title: "Red Bastard: Lie With Me")
    review = Review.new.get_or_build_review(source, @event.id)
    assert_equal(true, review.valid?)
  end
end
