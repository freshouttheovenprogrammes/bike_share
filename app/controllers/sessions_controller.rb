class SessionsController < ApplicationController

  def create
    user = User.update_or_create(request.env["omniauth.auth"])
    require "pry"; binding.pry
    session[:id] = user.id
    redirect_to root_path
  end
end
