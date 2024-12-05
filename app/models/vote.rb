class Vote < ApplicationRecord
  belongs_to :voting_session
  belongs_to :special_offer
  belongs_to :user

  after_create_commit :broadcast_newvotes
  #after_destroy_commit :broadcast_newvotes


  
  def broadcast_newvotes
    if self.voting_session
      broadcast_replace_to "vote_#{voting_session.id}_new",
                          partial: "voting_sessions/friendslist_li",
                          target: "voting#{Voter.find_by(user: self.user).id}",
                          locals: { voter: Voter.find_by(user: self.user),
                          voting_session: self.voting_session 
                        }
    end
  end

  
end
