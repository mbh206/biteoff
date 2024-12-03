class VotingSession < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :voters, dependent: :destroy
  has_many :users, through: :voters
  has_many :collections, dependent: :destroy
  has_many :special_offers, through: :collections
end
