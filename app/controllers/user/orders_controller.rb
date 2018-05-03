class User::OrdersController < ApplicationController
  before_action :set_user


  def show
    @order = Order.user_order(@user)
  end

  def index
    @orders = Order.user_all_orders(@user)
  end

  private

  def set_user
    @user = User.find(params[:format])
  end

end
