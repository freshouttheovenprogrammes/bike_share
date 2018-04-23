class ToolsController < ApplicationController
  def index
    @tools = Item.where(category_id: 3)
  end
end
