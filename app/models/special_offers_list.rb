class SpecialOffersList < ApplicationRecord
  has_many :offers_collection, dependent: :destroy
end
