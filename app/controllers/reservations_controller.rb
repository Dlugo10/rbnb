class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = policy_scope(Reservation)
  end

  def show
    @reservation = Reservation.find(params[:id])
    authorize @reservation
  end

  def new
    @flat = Flat.find(params[:flat_id])
    @reservation = Reservation.new
    authorize @reservation
  end

  def create
    @reservation = Reservation.new(reservation_params)
    authorize @reservation
    @reservation.user = current_user

    flat = Flat.find(params[:flat_id])
    @reservation.flat = flat

    if @reservation.save
      redirect_to flat_reservations_path, notice: 'Reservation was successfully created'
    else
      render :new
    end
  
  end

  def edit
    @flat = Flat.find(params[:flat_id])
    @reservation = Reservation.find(params[:id])

    authorize @reservation
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_params)

    redirect_to flat_reservation_path(@reservation.flat, @reservation)

    authorize @reservation
  end

  def destroy
    @reservation = Reservation.find(params[reservation])
    @reservation.destroy

    redirect_to flat_reservations_path(:id)

    authorize @reservation
  end

  private

  def reservation_params
    params.require(:reservation).permit(:price, :start_date, :end_date)
  end
end
