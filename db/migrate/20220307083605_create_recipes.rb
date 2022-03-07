class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.text :ingredient
      t.text :instruction
      t.integer :prep_time
      t.integer :cook_time
      t.integer :total_time
      t.string :image

      t.timestamps
    end
  end
end
