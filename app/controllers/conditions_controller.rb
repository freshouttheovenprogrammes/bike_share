class ConditionsController < ApplicationController

  def index
    @conditions = Condition.all.paginate(page: params[:page], per_page: 8)
  end



end
