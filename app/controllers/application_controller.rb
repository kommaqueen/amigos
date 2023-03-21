class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # This is to allow additional parameters at devise/registration/create
  before_action :configure_permitted_parameters, if: :devise_controller?

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :bio, :location])
  end
end
