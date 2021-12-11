class FreightsController < ApplicationController
  def show
    @freight = Freight.find(params[:id])
    @review = Review.new
    @reviews = Review.where(freight_id: params[:id])
    @reservations = Reservation.where(freight_id: params[:id])
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
    if params[:destination].present?
      @freights = Freight.where("depature ILIKE ?", "%#{params[:departure]}%")
      @freights = @freights.where("destination ILIKE ?", "%#{params[:destination]}%")
      @freights = @freights.where("date ILIKE ?", "%#{params[:date]}%") if params[:date].present?
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
      :estimated_time_arrival,
      :description,
      :truck_id
    )
  end
end
