class User::OrdersController < ApplicationController
  before_action :set_user

  def show
    @order = Order.user_order(@user)
  end

  def index
    @orders = current_user.orders
  end

  private

  def set_user
    @user = User.find(params[:format])
  end

end
