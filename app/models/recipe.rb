class Recipe < ApplicationRecord
  has_many :bookmarks
  has_many :comments
  has_many :reviews

  validates :title, presence: true
  validates :description, presence: true
  validates :ingredient, presence: true
  validates :instruction, presence: true
  validates :prep_time, presence: true
  validates :cook_time, presence: true
  validates :total_time, presence: true
  validates :image, presence: true
end
