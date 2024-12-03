class VotesController < ApplicationController

  def create
 
    if !Vote.find_by(user_id: current_user.id, 
      voting_session_id: params[:voting_session_id],
      special_offer_id: params[:vote][:special_offer_id])
      @vote = Vote.new(voter_params)
      @vote.user = current_user
      @voting_session = VotingSession.find(params[:voting_session_id])
      @vote.voting_session = @voting_session
      if @vote.save
        redirect_to voting_session_path(@voting_session)
      else
        render 'new', status: :unprocessable_entity
      end
    end
  end

  private

  def voter_params
    params.require(:vote).permit(:special_offer_id)
  end
end
