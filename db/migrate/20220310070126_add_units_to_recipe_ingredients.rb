class AddUnitsToRecipeIngredients < ActiveRecord::Migration[6.1]
  def change
    add_column :recipe_ingredients, :unit, :string
    add_column :recipe_ingredients, :amount, :string
  end
end
