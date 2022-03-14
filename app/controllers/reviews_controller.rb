class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end


  def show
    @review = Review.find(params[:recipe_id])
  end


  def create
    @review = Review.new(review_params)
    @recipe = Recipe.find(params[:recipe_id])
    @review.recipe = @recipe
    @review.user = current_user
    if @review.save
      redirect_to recipe_path(@review.recipe)
    else
      render :new
    end
  end

  def review_params
    params.require(:review).permit(:body, :rating)
  end
end
