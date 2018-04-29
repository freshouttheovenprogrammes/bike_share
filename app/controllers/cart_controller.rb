class CartController < ApplicationController
  include ActionView::Helpers::TextHelper
  before_action :set_item, only: [:destroy, :update]

  def index
  end

  def create
    @item = Item.find(params[:item_id])
    @cart.add_item(@item.id)
    session[:cart] = @cart.contents
    redirect_to items_path, notice:"You now have #{pluralize(@cart.count_of(@item.id), @item.title)} in cart."
  end

  def destroy
    @cart.remove_item(@item.id)
    session[:cart] = @cart.contents
    redirect_to items_path, notice:"You now have #{pluralize(@cart.count_of(@item.id), @item.title)} in cart."
  end

  def update
    if @cart.increase_item(@item)
      redirect_to cart_path
    elsif @cart.decrease_item(@item)
      redirect_to cart_path
    else
      render action: :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
end
