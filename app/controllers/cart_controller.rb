class CartController < ApplicationController
  include ActionView::Helpers::TextHelper
  before_action :set_item, only: [:destroy]
  before_action :set_item_id, only: [:create, :increase, :decrease]

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

  def increase
    @cart.increase_item(@item)
    redirect_to cart_index_path
  end

  def decrease
    @cart.decrease_item(@item)
    redirect_to cart_index_path
  end

  def update
    session[:cart] = @cart.contents
    if @cart.increase_item(@item)
      redirect_to cart_index_path
    elsif @cart.decrease_item(@item)
      redirect_to cart_index_path
    else
      render action: :index
      flash[:error] = "The Cart Had Troubles Updating Your Item"
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_item_id
    @item = Item.find(params[:item_id])
  end
end
