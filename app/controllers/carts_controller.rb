class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    @item = Item.find(params[:item_id])

    @cart = Cart.new(session[:cart])
    @cart.add_item(@item.id)
    session[:cart] = @cart.contents

    flash[:notice] = "You now have #{pluralize(@cart.count_of(@item.id), @item.title)}."
    redirect_to items_path
  end
end
