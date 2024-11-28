class Review < ApplicationRecord
  belongs_to :special_offer
  belongs_to :user
  has_many_attached :photos

  validates :description, presence: true, length: { in: 10..500 }
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
