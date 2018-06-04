class Admin::OrdersController < Admin::BaseController
  before_action :require_admin, only: [:index]

  def index
    @orders = Order.all
  end
end
