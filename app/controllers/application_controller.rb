class ApplicationController < ActionController::Base

  layout :set_layout

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :change_to_location

  def change_to_location
    if controller_name == "home" && current_user
      redirect_to dashboard_path
    end
  end

  def set_layout
    if ["registrations", "sessions", "passwords"].include? controller_name
      if current_user
        return  'admin'
      else
        return "login"
      end
    end
    return  'admin' if user_signed_in? && controller_name != "home"
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:phone_number, :email, :password, :country, :time_zone)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:phone_number, :email, :password, :current_password, :country, :time_zone)}
  end
end
