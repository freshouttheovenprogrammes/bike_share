class LessonsController < ApplicationController
  def index
    @lessons = Item.where(category_id: 4)
  end
end
