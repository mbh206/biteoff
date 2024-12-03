module ApplicationHelper
  def current_user_voting_session
    @current_user_voting_session ||= VotingSession.joins(voters: :user).find_by(users: { id: current_user.id })
  end
end
