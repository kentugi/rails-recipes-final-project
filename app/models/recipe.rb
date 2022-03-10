class Recipe < ApplicationRecord
  has_many :bookmarks
  has_many :comments
  has_many :reviews
  has_many :recipe_ingredients

  validates :title, presence: true
  # validates :description, presence: true
  validates :instruction, presence: true
  validates :prep_time, presence: true
  validates :cook_time, presence: true
  validates :total_time, presence: true
  validates :image, presence: true
end
