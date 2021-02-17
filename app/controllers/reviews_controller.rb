class ReviewsController < ApplicationController

  def new
    @review = Review.new # needed to instantiate the form_for
  end

  def create
    @review = Review.new(restaurant_params)
    @review.save

    # no need for app/views/restaurants/create.html.erb
    redirect_to review_path(@review)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
