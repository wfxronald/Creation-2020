class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    Rails.logger.debug "Access denied on #{exception.action} #{exception.subject.inspect}"
    # ...
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up)  { |u| u.permit(  :email, :password, :password_confirmation, :rules_and_regulations ) }
  end
end
