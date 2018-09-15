# rubocop:disable Metrics/LineLength 

class ApplicationController < ActionController::Base
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :authenticate_admin

  protected

  # for allowing :name as a strong parameter while signup and account update.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :user_type, :user_status)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :user_type, :user_status, :current_password)
    end
  end

  def authenticate_admin
    if current_user.email == 'bean.pranav@gmail.com'
      true
    else
      redirect_to root_path, notice: "You don't have permission to view this page.".html_safe
    end
  end
end
