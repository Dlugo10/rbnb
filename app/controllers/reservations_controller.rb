class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def show
    @reservations = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservations = Reservation.new(reservation_params)
    @reservations.save

    redirect_to reservations_path
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_params)

    redirect_to reservations_path(@reservation.id)
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    
    redirect_to reservations_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:price, :start_date, :end_date)
  end

end
