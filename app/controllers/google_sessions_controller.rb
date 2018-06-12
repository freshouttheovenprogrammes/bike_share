class GoogleSessionsController < ApplicationController
  def create
    user = User.update_or_create(request.env["omniauth.auth"])
    session[:user_id] = user.id
    flash[:notice] = "Welcome, #{user.first_name}"
    if user == current_user
      redirect_to "/dashboard"
    elsif user == current_admin
      redirect_to admin_dashboard_path
    else
      flash[:error] = "Could not validate credentials"
      redirect_to root_path
    end
  end
end
