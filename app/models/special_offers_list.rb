class SpecialOffersList < ApplicationRecord
  has_many :offers_collection, dependent: :destroy
  has_many :voting_sessions, dependent: :destroy
end
