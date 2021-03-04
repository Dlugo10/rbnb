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

    if @reservation.save!
      redirect_to flat_reservations_path, notice: 'Reservation was successfully created'
    else
      render :new
    end
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
