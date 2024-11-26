class Restaurant < ApplicationRecord
  validates :category, :address, presence: true
  validates :name, presence: true, uniqueness: true
  validates :lat, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :long, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  has_many :special_offers, dependent: :destroy  
  has_many_attached :photos
  belongs_to :user, foreign_key: true
end
