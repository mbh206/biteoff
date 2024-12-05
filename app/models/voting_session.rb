class VotingSession < ApplicationRecord
  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many :voters, dependent: :destroy
  has_many :users, through: :voters
  has_many :collections, dependent: :destroy
  has_many :special_offers, through: :collections
  has_many :restaurants, through: :special_offers

  # scope :fresh, -> { where status: 0}
  # scope :open, -> { where status: 1}
  # scope :end, -> { where status: 2}

  after_update_commit :broadcast_voting_session
  after_create_commit :change_default

  private

  def change_default
    self.status = 1
  end

  def broadcast_voting_session
    self.voters.each do |voter|
      broadcast_replace_to "votingsession_#{voter.user.id}_messages",
                          partial: "shared/iconnav",
                          target: "iconnav",
                          locals: { voting_session: self }
      end
  end
end
