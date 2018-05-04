class User::OrdersController < ApplicationController
  def create
    @order.assign_order(@user)
  end

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

  def order_params
    params(:order).permit(:total, :status, :user_id)
  end
end
