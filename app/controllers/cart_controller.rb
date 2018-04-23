class CartController < ApplicationController
  before_action :set_item, only: [:create, :destroy]
  include ActionView::Helpers::TextHelper

  def index
  end

  def create
    @cart.add_item(@item.id)
    session[:cart] = @cart.contents
    redirect_to items_path, notice:"You now have #{pluralize(@cart.count_of(@item.id), @item.title)} in cart."
  end

  def destroy
    @cart.remove_item(@item.id)
    session[:cart] = @cart.contents
    redirect_to items_path, notice:"You now have #{pluralize(@cart.count_of(@item.id), @item.title)} in cart."
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end
