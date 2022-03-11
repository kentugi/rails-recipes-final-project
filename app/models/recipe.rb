class Recipe < ApplicationRecord
  has_many :bookmarks
  has_many :comments
  has_many :reviews
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :title, presence: true
  # validates :description, presence: true
  validates :instruction, presence: true
  # validates :prep_time, presence: true
  # validates :cook_time, presence: true
  # validates :total_time, presence: true
  validates :image, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_label,
    associated_against: {
      ingredients: [:label]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
  end
