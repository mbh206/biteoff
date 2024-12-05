class Collection < ApplicationRecord
  belongs_to :special_offer
  belongs_to :voting_session

  after_create_commit :broadcast_new_special

  private

  def broadcast_new_special
    return if voting_session.collections.count == 1

    broadcast_append_to "collection_#{self.voting_session.id}_new_special",
                        partial: "voting_sessions/offerslist_li",
                        target: "votingspecialoffer",
                        locals: { special_offer: self.special_offer,voting_session: voting_session }
  end
end
