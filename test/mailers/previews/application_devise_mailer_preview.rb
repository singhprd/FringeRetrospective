# mailer/previews/devise_mailer_preview.rb

class ApplicationDeviseMailerPreview < ActionMailer::Preview
  # def confirmation_instructions
  #   ApplicationDeviseMailer.confirmation_instructions(User.first, "faketoken", {})
  # end

  def reset_password_instructions
    ApplicationDeviseMailer.reset_password_instructions(User.first, "faketoken")
  end
end
