class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id]) # restaurant for the form
    @review = Review.new # needed to instantiate the form_for
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id]) # restaurant for the review
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant.id)
    else
      render(:new) # render the new.html.erb
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
