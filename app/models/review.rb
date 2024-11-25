class Review < ApplicationRecord
  belongs_to :special_offer
  belongs_to :user
end
