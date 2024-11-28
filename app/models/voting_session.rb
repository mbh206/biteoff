class VotingSession < ApplicationRecord
  belongs_to :special_offers_list
  belongs_to :friend_group
  has_many :votes, dependent: :destroy
end
