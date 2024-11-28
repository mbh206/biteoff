class Vote < ApplicationRecord
  belongs_to :voting_session
  belongs_to :user
  belongs_to :special_offer
end
