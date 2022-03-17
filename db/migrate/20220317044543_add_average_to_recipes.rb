class AddAverageToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :average, :integer
  end
end
