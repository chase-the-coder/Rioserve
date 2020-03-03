class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy, :calc_occupation]

  def index
    @restaurants = policy_scope(Restaurant).order(created_at: :desc)
  end

  def show
    @markers =
      {
        lat: @restaurant.latitude,
        lng: @restaurant.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { restaurant: @restaurant })
      }
      @reservation = Reservation.new
    authorize @restaurant
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
    authorize @restaurant
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
    authorize @restaurant
  end

  def destroy
    @restaurant.destroy
    redirect_to user_path(current_user)
    authorize @restaurant
  end

  def calc_occupation
    # FIX THIS GAMBIARRA
    date = params.keys.first
    # FIX THIS GAMBIARRA

    @free_spots = @restaurant.capacity - @restaurant.occupation_for(date)
    authorize @restaurant
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:user_id, :name, :capacity, :category, :address, :price_range, :rating)
  end

end

