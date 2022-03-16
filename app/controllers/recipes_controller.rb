class RecipesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    if params[:recipe]
      session[:query] = params[:recipe][:label]
      @recipes = Recipe.search_by_label(params[:recipe][:label])
    else
      @recipes = Recipe.all
    end
  end

  def show
    @all_ingredients = RecipeIngredient.all
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = @recipe.recipe_ingredients
    @review = Review.new
    @reviews = @recipe.reviews.limit(4)
    @random_recipes = Recipe.random_recipes

    # @ingredient_list = []
    # @all_ingredients.each do |ingredient|
    #   if ingredient.recipe_id == @recipe.id
    #     i = ingredient.ingredient_id
    #     single_ingredient = Ingredient.find(i)
    #     @ingredient_list << single_ingredient.label
    #   end
    # end
    # @instructions_array = @recipe.instruction
  end

end
