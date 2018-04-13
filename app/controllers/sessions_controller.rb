class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.app_credentials.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
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
