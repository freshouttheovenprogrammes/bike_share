class TripsController < ApplicationController
  def index
    @trips = Trip.all.paginate(page: params[:page], per_page: 8)
  end

  def show
    @trip = Trip.find(params[:id])
  end
end
