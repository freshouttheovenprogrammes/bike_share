class OrdersController < ApplicationController
  before_action :admin_only

  def index
    @orders = Order.all
  end
end
