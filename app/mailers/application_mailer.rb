# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "FringeBot@edinfringe.co.uk"
  layout "mailer"
end
