class RestaurantsController < ApplicationController
  def index
    # lists all restaurants
    @restaurants = Restaurant.all
  end

  def show
    # displays one restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    # for form generation
    @restaurant = Restaurant.new
  end

  def create
    # posts new restaurant to db
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :category, :address, :phone_number)
  end
end
