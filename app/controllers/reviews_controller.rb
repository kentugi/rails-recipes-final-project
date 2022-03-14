class ReviewsController < ApplicationController

  def create
    @reviews = Review.new(review_params)
    @recipe = Recipe.find(params[:recipe_id])
    @reviews.recipe = @recipe
    @reviews.user = current_user
    if @review.save
      redirect_to recipe_path(@reviews.recipe)
    else
      render :new
    end
  end
end
