class VotingSessionsController < ApplicationController
  def csib
    @voting_session = VotingSession.new
    @voting_session.special_offers << SpecialOffer.find(params[:special_offer_id])
    @voting_session.users << current_user
    @voting_session.save

    render :show
  end
  def show
    unless @voting_session
      @voting_session = VotingSession.find(params[:id])
    end
  end
end
