class RestaurantsController < ApplicationController

  def top
    @restaurants = Restaurant.where(rating: 5)
  end

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
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant
    else
      render new:, status: :unprocessable_entity

    end

  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update

    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    redirect_to @restaurant

  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other

  end

private

def restaurant_params
  params.require(:restaurant).permit(:name, :address, :catagory, :phone_number)
end


end
