class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_admin!
    unless ((current_user.present?) && (current_user.has_role? :admin))
      redirect_to root_path
    end
  end

  def authenticate_admin_and_coordinator!
    unless ((current_user.present?) && (current_user.has_role? :admin) || (current_user.has_role? :coordinator))
      redirect_to root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :telephone
    devise_parameter_sanitizer.for(:sign_up) << :city
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
