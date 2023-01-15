class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound do |e|
    rescue_not_found(e)
  end

  private

  def rescue_not_found(e)
    render plain: e.message
  end
end
