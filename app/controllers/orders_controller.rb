class OrdersController < ApplicationController
  before_action :admin_only, only: [:index]

  def index
    @orders = Order.all
  end
end
