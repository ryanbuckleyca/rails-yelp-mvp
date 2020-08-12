class ReviewsController < ApplicationController
  before_action :find_review, only: [:show]

  def index
    # lists all reviews
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    # for form generation
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    # posts new review to db
    @review = Review.new(review_params)
    # get `restaurant_id` to associate with review
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def destroy
    # deletes the record
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
