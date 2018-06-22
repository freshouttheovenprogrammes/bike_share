class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user.default?
      user.app_credential.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/dashboard"
    elsif user.admin?
      user.app_credential.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_dashboard_path
    else
      flash[:error] = "Could not validate credentials"
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
