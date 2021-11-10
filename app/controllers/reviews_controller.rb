class ReviewsController < ApplicationController
  def index
    @restaurant = Restaurant.find( params[:restaurant_id] )
    @reviews = @restaurant.reviews
  end

  def new
    @restaurant = Restaurant.find( params[:restaurant_id] )
    @review = Review.new # to send an empty review for the form
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(strong_params)
    # @review.restaurant = @restaurant
    @review.restaurant_id = @restaurant.id
    if @review.save
      redirect_to restaurant_path(@restaurant.id)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant.id)
  end

  private

  def strong_params
    params.require(:review)
          .permit(:content)
  end
end
