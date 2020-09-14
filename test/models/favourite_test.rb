# frozen_string_literal: true

require "test_helper"

class FavouriteTest < ActiveSupport::TestCase
  setup do
    @user = Fabricate(:user)
    @event = Fabricate(:event)
    @vote = Vote.create(user_id: @user.id, event_id: @event.id, value: 1).save
    @favourite = Favourite.create(event: @event, user: @user)
  end

  test "easy_find_both_params" do
    assert_equal(@favourite, Favourite.easy_find(event_id: @event.id, user_id: @user.id))
  end

  test "easy_find_user" do
    assert_equal(@favourite, Favourite.easy_find(user_id: @user.id).first)
  end

  test "easy_find_returns_collection" do
    assert(Favourite.easy_find(user_id: @user.id).to_a.is_a?(Array))
  end

  test "easy_find_event" do
    assert_equal(@favourite, Favourite.easy_find(event_id: @event.id).first)
    assert_equal(@favourite, Favourite.easy_find(event_id: @event.id).first)
  end
end
