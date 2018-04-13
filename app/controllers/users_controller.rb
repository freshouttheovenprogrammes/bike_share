class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    app_credential = AppCredential.new(credential_params)
    user = app_credential.create_user(user_params)
    if app_credential.save && user.save
      flash[:notice] = "Welcome to BikeShare!"
      session[:user_id] = @user.id
      redirect_to users_path(@user)
    else
      flash[:error] = "There was an error processing your account!"
      redirect_to root_path
    end
  end

  def show
  end

  private

  def user_params
    if params[:user][:provider] == nil
      params.require(:user).permit(:username, :email, :first_name, :last_name, :password, :role)
    else
      params.require(:user).permit(:provider, :uid, :first_name, :last_name, :email, :oauth_token, :oauth_expires_at, :role)
    end
  end

  def set_user
    @user = User.find_by(params[:id])
  end

end
