class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[edit show destroy update]
  def show
  end

  def new
    @reservation = Reservation.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.restaurant_id = params[:restaurant_id]
    if @reservation.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to user_path(current_user)
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
    params.require(:reservation).permit(:number_of_people, :scheduled, :user_id, :restaurant_id)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
