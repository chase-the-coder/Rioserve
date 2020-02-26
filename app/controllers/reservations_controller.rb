class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show destroy edit update]
  def show
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.restaurant_id = params[:restaurant_id]
    if @reservation.save
      redirect_to root_path #should go to users show
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to reservation_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    @reservation.delete
    redirect_to root_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:number_of_people)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
