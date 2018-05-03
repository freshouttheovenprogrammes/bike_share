class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    app_credential = AppCredential.new(credential_params)
    @user = app_credential.create_user(user_params)
    if app_credential.save && @user.save
      flash[:notice] = "Welcome to BikeShare!"
      session[:user_id] = @user.id
      redirect_to dashboard_path(@user)
    else
      flash[:error] = "There was an error processing your account!"
      redirect_to root_path
    end
  end

  private

  def user_params
    params[:user].permit(:first_name, :last_name, :email)
  end

  def credential_params
    params[:user].permit(:password)
  end
end
