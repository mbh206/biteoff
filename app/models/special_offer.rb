class SpecialOffer < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :reviews, dependent: :destroy
  has_many_attached :photos
  has_many :votes, dependent: :destroy

  validates :category, :description, presence: true
  validates :confirmation_count, numericality: { greater_than_or_equal_to: 0 }
end
