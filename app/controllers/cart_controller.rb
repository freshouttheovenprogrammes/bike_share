class CartController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
  end

  def create
    @item = Item.find(params[:item_id])
    @cart.add_item(@item.id)
    session[:cart] = @cart.contents
    redirect_to items_path, notice:"You now have #{pluralize(@cart.count_of(@item.id), @item.title)} in cart."
  end

  def destroy
    @item = Item.find(params[:id])
    @cart.remove_item(@item.id)
    session[:cart] = @cart.contents
    redirect_to items_path, notice:"You now have #{pluralize(@cart.count_of(@item.id), @item.title)} in cart."
  end
end
