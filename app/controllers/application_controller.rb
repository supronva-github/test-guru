class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound do |e|
    rescue_not_found(e)
  end

  helper_method :current_user

  private
  
  def rescue_not_found(e)
    render plain: e.message
  end

  def authenticate_user!
    unless current_user
      redirect_to login_path, alert: 'Verify your Email and Password please'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
