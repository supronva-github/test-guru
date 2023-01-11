class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      path_to_redirect = cookies.delete(:preview_path)
      redirect_to path_to_redirect || root_path
    else
      flash.now[:alert] = 'Verify your Email and Password please'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'You are logged out'
  end
end
