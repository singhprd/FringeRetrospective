# Preview all emails at http://localhost:3000/rails/mailers/user_invite_mailer
class UserInviteMailerPreview < ActionMailer::Preview
  def invite_email
    ApplicationDeviseMailer.invitation_instructions(User.first, "faketoken")
  end
end
