class Restaurant < ApplicationRecord
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :special_offers, dependent: :destroy
  has_many_attached :photos
  belongs_to :user
  geocoded_by :address

  validates :category, :address, presence: true
  validates :name, presence: true, uniqueness: true
  # validates :lat
  # validates :long
end
