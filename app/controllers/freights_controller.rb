class FreightsController < ApplicationController
  def show
    @freight = Freight.find(params[:id])
    @review = Review.new
    @reviews = Review.where(trip_id: params[:id])
    @reservations = Reservation.where(trip_id: params[:id])
  end

  def new
    @freight = Freight.new
  end

  def create
    @freight = Freight.new(freight_params)
    @freight.save
    redirect_to freight_path(@freight)
  end

  def index
    if params[:query].present?
      @freights = Freight.where("destination ILIKE ?", "%#{params[:query]}%")
    else
      @freights = Freight.all
    end
  end

  private

  def freight_params
    params.require(:freight).permit(
      :date,
      :departure,
      :destination,
      :price,
      :departure_time,
      :estimated_time_arrival
    )
  end
end
