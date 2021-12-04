class FreightsController < ApplicationController
  def show
  end

  def new
    @freight = Freight.new
  end

  def create
    @trucks = Truck.all
    @available_trucks = []
    @trucks.each do |truck|
      @available_trucks << truck.id
    end
    @freight = Freight.new(freight_params)
    @freight.save
    redirect_to root_path
  end

  def index
    @freights = Freight.all
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
