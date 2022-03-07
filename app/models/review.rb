class Review < ApplicationRecord
  belongs_to :recipe
  belongs_to :user

  RATING = [1, 2, 3, 4, 5]

  validates :header, length: { in: 1..50 }, presence: true
  validates :body, length: { in: 1..500 }, presence: true
  validates :rating, inclusion: { in: RATING }
end
