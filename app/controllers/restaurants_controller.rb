class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    id = params[:id]
    @restaurant = Restaurant.find(id)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(strong_params)
    @restaurant.save
    redirect_to restaurants_path
  end

  def edit
    id = params[:id]
    @restaurant = Restaurant.find(id)
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private
  def strong_params
    params.require(:restaurant).permit(:name, :address, :rating)
  end
end
