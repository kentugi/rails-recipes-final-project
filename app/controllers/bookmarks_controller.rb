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
  end

  def index
    @bookmark = Bookmark.where(user: current_user)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
  end

end
