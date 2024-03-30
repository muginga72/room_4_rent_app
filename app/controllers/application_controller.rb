class ApplicationController < ActionController::Base
  layout :set_layout
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def set_layout
    # If current_user && current_user.admin == true
    # Ensure you wont error if not logged in when you check if admin
    if current_user&.admin?
      "admin"
    else
      "application"
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit({ roles: [] },
      :email, :password, :password_confirmation, :current_password)
    end
  end
end
