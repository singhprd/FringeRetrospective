# app/mailers/my_devise_mailer.rb
include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`

class ApplicationDeviseMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views

  default from: "FringeBot@edinfringe.co.uk"
  layout "mailer"

  # Overrides same inside Devise::Mailer
  def confirmation_instructions(record, token, opts={})
    set_organization_of record
    super
  end

  # Overrides same inside Devise::Mailer
  def reset_password_instructions(record, token, opts={})
    set_organization_of record
    super
  end

  # Overrides same inside Devise::Mailer
  def unlock_instructions(record, token, opts={})
    set_organization_of record
    super
  end

  def invitation_instructions(record, token, opts={})
    set_organization_of record
    super
  end

  private
  ##
  # Sets organization of the user if available
  def set_organization_of(user)
    @organization = user.organization rescue nil
  end
end
