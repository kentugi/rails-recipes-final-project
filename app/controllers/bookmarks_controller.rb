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

    redirect_to recipes_path(anchor: "bookmark-hover-#{@recipe.id}")
  end

  def index
    @bookmarks = Bookmark.where(user: current_user)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @recipe = @bookmark.recipe
    @bookmark.destroy
    redirect_to recipes_path(anchor: "bookmark-hover-#{@recipe.id}")
  end

end
