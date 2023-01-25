class ApplicationController < ActionController::Base
  before_action :configure_sign_up_params, if: :devise_controller?
  before_action :authenticate_user!
  before_action :set_locale

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

  def default_url_options
    { lang: I18n.default_locale == I18n.locale ? nil : I18n.locale }
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
