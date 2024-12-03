class VotesController < ApplicationController

  def create
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

  private

  def voter_params
    params.require(:vote).permit(:special_offer_id)
  end
end
