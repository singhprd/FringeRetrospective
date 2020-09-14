class Users::InvitationsController < Devise::InvitationsController
  before_action :remove_header
  before_action :configure_permitted_parameters, if: :devise_controller?

  def update
    super { |user| user.username = params[:user][:username] }
  end

  protected

  def remove_header
    @no_header = true
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:username])
  end
end
