class TrucksController < ApplicationController
  def new
    @truck = Truck.new
  end

  def create
    @truck = Truck.new(truck_params)
    @user = current_user
    @truck.user = @user
    @truck.save!
    flash[:alert] = "Truck registered successfully"
    redirect_to new_freight_url
  end

  def index
    @trucks = Truck.all
  end

  private

  def truck_params
    params.require(:truck).permit(:capacity, :model)
  end
end
