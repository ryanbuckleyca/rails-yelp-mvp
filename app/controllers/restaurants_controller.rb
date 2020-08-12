class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    # lists all restaurants
    @restaurants = Restaurant.all
  end

  def show
    # displays one restaurant
  end

  def new
    # for form generation
    @restaurant = Restaurant.new
  end

  def create
    # posts new restaurant to db
    @restaurant = Restaurant.new(restaurant_params)

    redirect_to restaurant_path(@restaurant)
  end

  def edit
    # for form generation
  end

  def update
    # changes the record in db
    @restaurant = Restaurant.update(restaurant_params)

    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    # deletes the record
    @restaurant.delete

    redirect_to restaurants_path
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :stars)
  end
end
