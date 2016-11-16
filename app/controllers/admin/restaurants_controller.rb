class Admin::RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [ :show, :edit, :update, :destroy ] # permet de ne pas répéter le code de set_restaurant
  def index
    @restaurants = Restaurant.all
  end

  def show
    # @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    # Restaurant.new(params[:restaurant]) # possible grâce au form_for mais dangereux
    @restaurant = Restaurant.new(restaurant_params) # strong params : limite les params qui seront stockés en DB
    if @restaurant.save
      redirect_to admin_restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
    # @restaurant = Restaurant.find(params[:id])
  end

  def update
    # @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    @restaurant.save
    redirect_to admin_restaurant_path(@restaurant)
  end

  def destroy
    # @restaurant = Restaurant.find(params[:id])
    @restaurant.delete
    redirect_to admin_restaurants_path
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
