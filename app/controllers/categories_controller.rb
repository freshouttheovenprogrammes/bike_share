class CategoriesController < ApplicationController


  def index
    if params[:bikes]
      @items = Item.where("categories_id = ?", 1 )
    end



  end





end