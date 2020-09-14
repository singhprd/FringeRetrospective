# frozen_string_literal: true

module SignInHelper
  def sign_in(user)
    visit("/")
    click_on("Sign in")
    fill_in("Email", with: user.email)
    fill_in("Password", with: user.password)

    click_button("Log in")

    assert has_current_path?("/")
  end
end
