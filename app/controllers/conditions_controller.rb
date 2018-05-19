class ConditionsController < ApplicationController
  def index
    @conditions = Condition.all.paginate(page: params[:page], per_page: 8)
  end

  def show
    @condition = Condition.find(params[:id])
  end
end
