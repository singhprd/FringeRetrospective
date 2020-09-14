# frozen_string_literal: true

require "application_system_test_case"

class SessionsTest < ApplicationSystemTestCase
  test "login" do
    visit "/"
    click_on("Sign in")

    click_on("Sign up")
    fill_in("Email", with: "test@test.com")
    fill_in("Username", with: "test username")

    fill_in("Password", with: "password")
    fill_in("Password confirmation", with: "password")

    click_button("Sign up")

    click_on("Account")
    click_on("Sign out")

    click_on("Sign in")
    fill_in("Email", with: "test@test.com")
    fill_in("Password", with: "password")

    click_button("Log in")

    assert has_current_path?("/")

    click_on("Account")
    assert page.has_text?("Sign out")
  end

  test "logging in with helper" do
    user = create(:user)
    sign_in(user)
    assert has_current_path?("/")
    click_on("Account")
    assert page.has_text?("Sign out")
  end
end
