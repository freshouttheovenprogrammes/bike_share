class AccessoriesController < ApplicationController
  def index
    @accessories = Item.where(category_id: 2)
  end
end
