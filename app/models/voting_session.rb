class VotingSession < ApplicationRecord
  has_many :votes
  has_many :users, through: :voters
  has_many :special_offers, through: :collections
end
