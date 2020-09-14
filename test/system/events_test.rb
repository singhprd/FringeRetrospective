# frozen_string_literal: true

require "application_system_test_case"

class EventsTest < ApplicationSystemTestCase
  setup do
    @user = create(:user)
  end
  test "visiting the search form and verify results" do
    sign_in(@user)

    visit "/searches/new"
    assert_selector "#search-panel", text: "Search"
    select("2016", from: "Year")
    select("Edinburgh's Hogmanay", from: "Festival")
    click_button("Search")

    assert page.has_selector?("home_card", count: 5)
    click_on("Concert in the Gardens")

    # click_on("❤️️")

    assert page.has_selector?("home_card", count: 1)
    assert_selector "a", text: "Concert in the Gardens"

    click_on("🗓️")
    assert page.has_table?("performances_for_event24")

    page.assert_selector("td", text: "Saturday 31st December 2016", visible: true)
    page.assert_selector("td", text: "20:00", visible: true)
    page.assert_selector("td", text: "01:00", visible: true)

    click_on("🗓️")
    assert page.has_no_table?("performances_for_event24")

    page.assert_selector("button", text: "0", visible: true)
    click_on("👍")
    click_on("👍")
    click_on("👍")
    page.assert_selector("button", text: "3", visible: true)

    click_on("Home")
    click_button("Favourite")

    click_button("2016")

    # navigate().refresh();

    assert page.has_selector?("home_card", count: 1)
    assert_selector "a", text: "Concert in the Gardens"

    # click_link("🗓️")
    # assert_selector "#performances_for_event183"
  end
end
