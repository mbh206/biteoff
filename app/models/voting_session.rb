class VotingSession < ApplicationRecord
  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many :voters, dependent: :destroy
  has_many :users, through: :voters
  has_many :collections, dependent: :destroy
  has_many :special_offers, through: :collections

  # scope :fresh, -> { where status: 0}
  # scope :open, -> { where status: 1}
  # scope :end, -> { where status: 2}

end

