class Collection < ApplicationRecord
  belongs_to :special_offer
  belongs_to :voting_session
end
