class RestaurantsController < ApplicationController
  before_action :find_restaurant, only:[:update, :edit, :show, :destroy ]
  def index
    @restaurants = Restaurant.all
  end

  def top
    @restaurants = Restaurant.where(rating: 5)
  end

  def show
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def update
    @restaurant.update(strong_params)
    redirect_to restaurant_path(@restaurant)
  end

  def create
    @restaurant = Restaurant.new(strong_params)
    @restaurant.save
    redirect_to restaurants_path
  end

  def edit
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private
  def strong_params
    params.require(:restaurant).permit(:name, :address, :rating)
  end

  def find_restaurant
    id = params[:id]
    @restaurant = Restaurant.find(id)
  end
end
