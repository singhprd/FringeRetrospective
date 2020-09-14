# frozen_string_literal: true

require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  # setup do
  #   @event = Fabricate(:event)
  #   # @new_event = Fabricate(:event)
  #   @user = Fabricate(:user)
  #   @admin_user = Fabricate(:user)
  #   @admin_user.update_attributes(admin: true)
  #   sign_in @admin_user
  # end

  # test "should get is_favourited?" do
  #   get events_url
  #   assert_response :success
  # end

  # test "should get index" do
  #   get events_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get new_event_url
  #   assert_response :success
  # end

  # # TODO: Need to test against the API data!
  # # test "should create event" do
  # #   # puts "somethting"
  # #   # params = Fabricate.attributes_for(:event)
  # #   # puts params
  # #   # raise
  # #   post events_url, params: Fabricate.attributes_for(:event)
  # #   assert_equal true, Fabricate.attributes_for(:event)
  # # end

  # #   assert_redirected_to event_url(Event.last)
  # # end

  # test "should show event" do
  #   get event_url(@event)
  #   assert_response :success
  # end

  # # TODO Test Once Admin User Setup and Signed in
  # test "should get edit" do
  #   get edit_event_url(@event)
  #   assert_response :success
  # end

  # test "should update event" do
  #   patch event_url(@event), params: Fabricate.attributes_for(:event)
  #   assert_redirected_to event_url(@event)
  # end

  # test "should destroy event" do
  #   assert_difference("Event.count", -1) do
  #     delete event_url(@event)
  #   end
  #   assert_redirected_to events_url
  # end
end
