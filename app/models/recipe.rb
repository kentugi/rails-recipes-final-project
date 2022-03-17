class Recipe < ApplicationRecord
  has_many :bookmarks
  has_many :comments
  has_many :reviews
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  # serialize :instruction, Array

  validates :title, presence: true
  # validates :description, presence: true
  # validates :instruction, presence: true
  # validates :prep_time, presence: true
  # validates :cook_time, presence: true
  # validates :total_time, presence: true
  validates :image, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_label,
  against: [ :title ],
    associated_against: {
      ingredients: [:label]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  def self.random_recipes
    random_recipes = Recipe.all
    random_recipes.sample(4)
  end

  def avr_rating
    reviews.pluck(:rating).sum/reviews.size
  end
end
