class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all

    respond_to do |format|
       # if not specified -> html
       # if you ask for json, give json
       format.html
       format.json { render json: { restaurants: @restaurants } }
     end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end
end
