class RestaurantsController < ApplicationController
  # before_action :find_restaurant, only: [:show]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(set_restaurant)
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def set_restaurant
    params.require(:restaurant).permit(:name, :address, :categroy, :reviews)
  end
end
