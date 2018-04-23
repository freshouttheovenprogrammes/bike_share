class BikesController < ApplicationController
  def index
    @bikes = Item.where(category_id: 1)
  end
end
