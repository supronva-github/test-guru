class ApplicationController < ActionController::Base
  before_action :configure_sign_up_params, if: :devise_controller?
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound do |e|
    rescue_not_found(e)
  end

  private

  def after_sign_in_path_for(current_user)
    if current_user.admin?
     admin_tests_path
    else
     root_path
    end
   end

  def rescue_not_found(e)
    render plain: e.message
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
