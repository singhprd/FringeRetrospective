# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # TODO: Add flash message to failed 401 signin
  # POST /resource/sign_in
  def create
    # super
    if user_signed_in?
      render "success.js"
    else
      render "failure.js"
    end
  end

  # self.resource = warden.authenticate!(auth_options)
  # raise
  # set_flash_message!(:notice, :signed_in)
  # sign_in(resource_name, resource)
  # yield resource if block_given?
  # respond_with resource, location: after_sign_in_path_for(resource)

  # DELETE /resource/sign_out
  def destroy
    # super
    sign_out @user
    redirect_to "/"
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
