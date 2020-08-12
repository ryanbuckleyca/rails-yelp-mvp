class ReviewsController < ApplicationController
  before_action :find_review, only: [:show, :edit, :update, :destroy]

  def index
    # lists all reviews
    @reviews = Review.all
  end

  def show
    # displays one review
  end

  def new
    # for form generation
    @review = Review.new
  end

  def create
    # posts new review to db
    @review = Review.new(review_params)

    redirect_to review_path(@review)
  end

  def edit
    # for form generation
  end

  def update
    # changes the record in db
    @review = Review.update(review_params)

    redirect_to review_path(@review)
  end

  def destroy
    # deletes the record
    @review.delete

    redirect_to reviews_path
  end

  private

  def find_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:name, :address, :stars)
  end
end
