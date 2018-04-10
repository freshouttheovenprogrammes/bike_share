class UsersController < ApplicationController
  before_action

  def new
    @user = User.new
  end

  def create
  end

  private

  # def set_user
  #   params.require(:user).permit()
  # end

end
