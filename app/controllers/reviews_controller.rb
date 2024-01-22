class ReviewsController < ApplicationController
  def create
    @review = Review.new(strong_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(params[:restaurant_id]), status: :see_other
    else
      render "restaurants/show" , status: :unprocessable_entity
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to restaurant_path(review.restaurant), status: :see_other
  end

  private
  def strong_params
    params.require(:review).permit(:content)
  end
end
