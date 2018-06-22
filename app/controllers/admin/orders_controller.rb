class Admin::OrdersController < Admin::BaseController
  before_action :require_admin, only: [:index]

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @items = @order.items
  end
end
