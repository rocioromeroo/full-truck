class ReservationsController < ApplicationController
  def new
    @freight = Freight.find(params[:freight_id])
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new
    @freight = Freight.find(params[:freight_id])
    @user = current_user
    @reservation.freight = @freight
    @reservation.user = @user
    @reservation.save!
    flash[:alert] = "Reserva realizada correctamente!"
    redirect_to freight_path(@freight)
  end

  def index
    @reservations = Reservation.all
    @freight_id = []
    @reservations.each do |reservation|
      @freight_id << reservation.freight_id
    end
    @reservations = Freight.select([:destination]).where(id: @freight_id)[0].destination
  end
end
