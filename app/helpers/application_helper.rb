module ApplicationHelper
  def current_voting_session(user)
    VotingSession.joins(voters: :user).find_by(users: { id: user.id })
  end  

  def current_user_voting_session_as_master
    @current_user_voting_session ||= VotingSession.find_by(user_id: current_user.id)
  end

  def current_user_voted_location
    #@current_user_voting_session ||= VotingSession.find_by(user_id: current_user.id)
    session = current_voting_session(current_user)
    vote = Vote.where(voting_session_id: session).group(:special_offer_id).order('COUNT(special_offer_id) DESC').limit(1).count
    @sp_offer = SpecialOffer.find(vote.keys.first)
    @current_user_voted_location = @sp_offer.restaurant
    return [@sp_offer, @current_user_voted_location]
  end

end
