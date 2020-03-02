class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[edit show destroy update]
  def show
    @restaurant = @reservation.restaurant
    @markers =
      {
        lat: @restaurant.latitude,
        lng: @restaurant.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { restaurant: @restaurant })
      }
    authorize @reservation
  end

  def new
    @reservation = Reservation.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    authorize @reservation
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
    authorize @reservation
  end

  def edit
    authorize @reservation
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to reservation_path(@reservation)
    else
      render :edit
    end
  end

  def destroy
    @reservation.delete
    redirect_to user_path(current_user)
    authorize @reservation
  end

  private

  def reservation_params
    params.require(:reservation).permit(:number_of_people, :date, :time, :user_id, :restaurant_id)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
