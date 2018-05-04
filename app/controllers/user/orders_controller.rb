class User::OrdersController < ApplicationController
  # before_action :set_user, only: [:show]

  def show
    @order = Order.find(params[:id])
  end

  def index
    @user = User.find(params[:format])
    @orders = @user.orders
  end

  private

  def set_user
    @user = User.find(params[:format])
  end

end
