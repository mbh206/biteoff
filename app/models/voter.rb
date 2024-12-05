class Voter < ApplicationRecord
  belongs_to :user
  belongs_to :voting_session

  after_create_commit :broadcast_voting_session

  private 
  def broadcast_voting_session
    
      broadcast_replace_to "votingsession_#{self.user.id}_messages",
                          partial: "shared/iconnav",
                          target: "iconnav",
                          locals: { voting_session: self.voting_session }
  
  end
end
