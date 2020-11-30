class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
  end

  # Helper methods to render Devise's log in view on welcome page
  helper_method :resource, :resource_name, :devise_mapping

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  # Use these method to direct the user to any page after sign in or up.
  def after_sign_in_path_for(resource)
    posts_path(current_user)
  end

  def after_sign_up_path_for(resource)
    posts_path(current_user)
  end
end
