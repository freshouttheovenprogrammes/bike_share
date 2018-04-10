class UsersController < ApplicationController
  # before_action

  def new
    @user = User.new
  end

  def create
    @user = User.create!(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find_by(params[:id])
  end

  private

  def user_params
    if params[:user][:provider] == nil
      params.require(:user).permit(:username, :email, :first_name, :last_name, :password)
    else
      params.require(:user).permit(:provider, :uid, :first_name, :last_name, :email, :oauth_token, :oauth_expires_at)
    end
  end

end
