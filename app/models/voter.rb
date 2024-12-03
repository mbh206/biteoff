class Voter < ApplicationRecord
  belongs_to :user
  belongs_to :voting_session
end
