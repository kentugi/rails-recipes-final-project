class Review < ApplicationRecord
  belongs_to :raiting
  belongs_to :recipe

  RATING = [1, 2, 3, 4, 5]

  validates :header, length: { in: 1..50 }, presence: true
  validates :body, length: { in: 1..500 }, presence: true
  validates :rating, inclusion: { in: RATING }
end
