class RestaurantsController < ApplicationController

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :capacity, :category, :address, :price_range)
  end
end

