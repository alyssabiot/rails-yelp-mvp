class Admin::ReviewsController < ApplicationController
  before_action :set_restaurant
  before_action :set_review, only: [ :destroy, :edit, :update ]
  def new
    @review = Review.new
  end

  def create
    @review = @restaurant.reviews.build(review_params)
    if @review.save
      redirect_to admin_restaurant_path(@restaurant)
    else
      render :new # renvoie au formulaire en cas d'erreur de validation
    end
  end

  def edit
  end

  def update
    @review.update(review_params)
    @review.save
    redirect_to admin_restaurant_path(@restaurant)
  end

  def destroy
    @review.delete
    redirect_to admin_restaurant_path(@restaurant)
  end

  private
  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

   def set_review
    @review = Review.find(params[:id])
  end
end
