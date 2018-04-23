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
    redirect_to items_path  # notice: %Q["Successfully removed <a href="/#{@item.category}s/"#{@item.id}</a> from your cart."].html_safe
  end
end


#  <a href="/jobs/list?job=#{update.id}">#{update.id}</a>]
