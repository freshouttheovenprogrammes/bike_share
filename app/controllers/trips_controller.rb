class TripsController < ApplicationController

  def index
    @trips = Trip.all.paginate(page: params[:page], per_page: 8)
  end




end
