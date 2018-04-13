class GoogeSessionsController < ApplicationController

  def create
    require "pry"; binding.pry
     user = User.update_or_create(request.env["omniauth.auth"])
     session[:user_id] = user.id
     flash[:notice] = "Welcome, #{user.first_name}"
     redirect_to user_path(user)
  end

end
