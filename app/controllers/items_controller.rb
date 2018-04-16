class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
  end

  def index
    if request.path.split('/').last == "bikes"
      @items = Item.where(categories_id: 1 )
      @cart = Cart.new(session[:cart])
    elsif request.path.split('/').last == "accessories"
      @items = Item.where(categories_id: 2 )
      @cart = Cart.new(session[:cart])
    elsif  request.path.split('/').last == "tools"
      @items = Item.where(categories_id: 3 )
      @cart = Cart.new(session[:cart])
    elsif  request.path.split('/').last == "lessons"
      @items = Item.where(categories_id: 4 )
      @cart = Cart.new(session[:cart])
    elsif  request.path.split('/').last == "items"
      @items = Item.order(:categories_id)
      @cart = Cart.new(session[:cart])
    end
  end


end
