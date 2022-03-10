class Ingredient < ApplicationRecord
  has_many :recipe_ingredients

  validates :label, presence: true, uniqueness: true

end
