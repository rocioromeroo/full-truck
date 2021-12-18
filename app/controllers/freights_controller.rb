class FreightsController < ApplicationController
  def show
    @freight = Freight.find(params[:id])
    @review = Review.new
    @reviews = Review.where(freight_id: params[:id])
    @reservations = Reservation.where(freight_id: params[:id])
  end

  def new
    @freight = Freight.new
    @freight.build_truck
  end

  def create
    @freight = Freight.new(freight_params)
    @freight.save
    redirect_to freight_path(@freight)
  end

  def index
    @freights = Freight.all
    if params.dig(:freight, :destination).present?
      @freights = @freights.where("destination ILIKE ?", "%#{params[:freight][:destination]}%")
    end
    if params.dig(:freight, :departure).present?
      @freights = @freights.where("departure ILIKE ?", "%#{params[:freight][:departure]}%")
    end
    if params.dig(:freight, :date).present?
      @freights = @freights.where(date: params[:freight][:date])
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
      :truck_id,
      :cover_image,
      gallery_images: [],
      truck_attributes: [:capacity]
    )
  end
end
