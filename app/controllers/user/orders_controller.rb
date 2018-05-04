class User::OrdersController < ApplicationController
  def create
    user = User.find(session[:user_id])
    @order = user.orders.create(total: @cart.total_sum, status: "Ordered")
    session[:cart].map do |accessory_id, quantity|
      @order.order_items.create(item_id: accessory_id.to_i,
                                      order_id: @order.id)
     end
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
