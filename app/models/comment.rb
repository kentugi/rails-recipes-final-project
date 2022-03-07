class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :remarks, length: { in: 1..150 }, presence: true

end
