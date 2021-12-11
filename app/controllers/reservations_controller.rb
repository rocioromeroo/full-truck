class ReservationsController < ApplicationController
  def new
    @freight = Freight.find(params[:freight_id])
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new
    @freight_id = Freight.find(params[:freight_id])
    @user = current_user
    @reservation.freight = @freight
    @reservation.user = @user
    @reservation.save!
    flash[:alert] = "Reserva realizada correctamente!"
    redirect_to freight_path(@freight)
  end

  def index
    @reservations = Reservation.all
    @trip_id = []
    @reservations.each do |reservation|
      @trip_id << reservation.trip_id
    end
    @reservations = Trip.select([:destination]).where(id: @trip_id)[0].destination
  end
end
