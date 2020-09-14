# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @event = Fabricate(:event)
    @user = Fabricate(:user)
    # user = create(:user)
  end

  test "user has a username" do
    assert(@user.username)
  end

  test "test_has_100_votes_by_default" do
    assert_equal(100, @user.votes_left)
  end

  test "reduce_votes_left" do
    assert @user.reduce_votes_left
    assert_equal(99, @user.votes_left)
  end

  test "votes_dont_go_negative" do
    @user.votes_left = 2
    @user.save
    assert @user.reduce_votes_left
    assert_equal(1, @user.votes_left)
    assert @user.reduce_votes_left
    assert_equal false, @user.reduce_votes_left
    assert_equal 0, @user.votes_left
  end
end
