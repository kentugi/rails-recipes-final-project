class RecipesController < ApplicationController
  def index
    if params[:recipe]
      @recipes = Recipe.search_by_label(params[:recipe][:label])
    else
      @recipes = Recipe.all
    end
  end

  def show
    @all_ingredients = RecipeIngredient.all
    @recipe = Recipe.find(params[:id])
    @ingredient_list = []
    @all_ingredients.each do |ingredient|
      if ingredient.recipe_id == @recipe.id
        i = ingredient.ingredient_id
        single_ingredient = Ingredient.find(i)
        @ingredient_list << single_ingredient.label
      end
    end
    @instructions_array = @recipe.instruction.split('.')
  end
end
