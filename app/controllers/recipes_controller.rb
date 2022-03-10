class RecipesController < ApplicationController
  def index
    if params[:recipe]
      @recipes = Recipe.search_by_label(params[:recipe][:label])
    else
      @recipes = Recipe.all
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end


end
