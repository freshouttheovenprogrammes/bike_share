class UsersController < ApplicationController
  # before_action

  def new
    @user = User.new
  end

  def create
    @user = User.create!(user_params)
    if user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
  end

  private

  def user_params
    require "pry"; binding.pry
    if user.provider.nil
      params.require(:user).permit(:username, :email, :password)
    else
      params.require(:user).permit(:provider, :uid, :first_name, :last_name, :email, :oauth_token, :oauth_expires_at)
    end
  end

end
