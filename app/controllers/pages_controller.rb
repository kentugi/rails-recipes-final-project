class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :components, ]
  def home
    @random_recipes = Recipe.random_recipes
  end

  def components
  end
end
