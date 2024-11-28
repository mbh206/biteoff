class FriendGroup < ApplicationRecord
  has_many :group_members, dependent: :destroy 
  validates :name, presence: true, length: { in: 5..20 }
end
