# frozen_string_literal: true

require 'google/apis/people_v1'
require 'google/api_client/client_secrets.rb'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!

  def check_admin
    raise "User is not Admin!" unless current_user.try(:admin?)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(
        :username, :email,
        :password, :password_confirmation,
        :remember_me
        )
    end
    devise_parameter_sanitizer.permit(:sign_in) do |u|
      u.permit(
        :username, :email,
        :password, :remember_me
        )
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(
        :username, :email,
        :password, :current_password
        )
    end
  end

  People = Google::Apis::PeopleV1

  def contacts
    secrets = Google::APIClient::ClientSecrets.new(
    {
      "web" =>
      {
        "access_token" => current_user.token,
        "refresh_token" => current_user.refresh_token,
        "client_id" => Rails.application.secrets[:google_client_id],
        "client_secret" => Rails.application.secrets[:google_secret]
      }
    }
    )
    service = People::PeopleServiceService.new
    service.authorization = secrets.to_authorization
    response = service.list_person_connections(
      'people/me',
      person_fields: ['names', 'emailAddresses', 'phoneNumbers']
      )
    render json: response
  end
end
