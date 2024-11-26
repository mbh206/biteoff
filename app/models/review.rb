class Review < ApplicationRecord
  belongs_to :special_offer, foreign_key: true
  belongs_to :user, foreign_key: true
  has_many_attached :photos

  validates :description, presence: true, length: { in: 50..500 }
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
