class SessionsController < ApplicationController

  def create
    # require "pry"; binding.pry
    user = User.find_by(email: params[:email])
    # require "pry"; binding.pry
    if user && user.app_credentials.authenticate(params[:password])
      # require "pry"; binding.pry
      session[:user_id] = user.id
      redirect_to users_path(user)
    else
      # require "pry"; binding.pry
      flash[:error] = "Could not validate credentials"
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
