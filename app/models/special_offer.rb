class SpecialOffer < ApplicationRecord
  belongs_to :user, :restaurant, foreign_key: true
  validates :type, :description, :start_date, presence: :true
  has_many :reviews, dependent: :destroy
  validates :confirmation_count, numericality: { greater_than_or_equal_to: 0 }
  has_many_attached :photos
end
