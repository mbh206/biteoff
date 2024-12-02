class Vote < ApplicationRecord
  belongs_to :voting_session
  belongs_to :special_offer
  belongs_to :user
end
