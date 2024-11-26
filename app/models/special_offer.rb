class SpecialOffer < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :category, :description, presence: true
  has_many :reviews, dependent: :destroy
  validates :confirmation_count, numericality: { greater_than_or_equal_to: 0 }
  has_many_attached :photos
end
