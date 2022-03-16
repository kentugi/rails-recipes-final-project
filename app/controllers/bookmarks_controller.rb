class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new
    @recipe = Recipe.find(params[:recipe_id])
    @bookmark.user = current_user
    @bookmark.recipe = @recipe
    @bookmark.save
    if Rails.application.routes.recognize_path(request.referrer)[:action] == "show"
      redirect_to recipe_path(@recipe)
    else
      redirect_to recipes_path(recipe: { label: session[:query] }, anchor: "bookmark-hover-#{@recipe.id}")
    end
  end

  def index
    @bookmarks = Bookmark.where(user: current_user)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @recipe = @bookmark.recipe
    @bookmark.destroy
    if Rails.application.routes.recognize_path(request.referrer)[:action] == "show"
      redirect_to recipe_path(@recipe)
    else
      redirect_to recipes_path(recipe: { label: session[:query] }, anchor: "bookmark-hover-#{@recipe.id}")
    end
  end

end
