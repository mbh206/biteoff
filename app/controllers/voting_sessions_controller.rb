class VotingSessionsController < ApplicationController
  def csib
    @voting_session = VotingSession.new
    collection = Collection.new
    collection.special_offer = SpecialOffer.find(params[:special_offer_id])
    collection.voting_session = @voting_session
    collection.save!
    voter = Voter.new
    voter.user = current_user
    voter.voting_session = @voting_session
    voter.save!
    @voting_session.save!

    redirect_to voting_session_path(@voting_session)
  end
  def show
    @voter = Voter.new
    @collection = Collection.new
    @vote = Vote.new
    unless @voting_session
      @voting_session = VotingSession.find(params[:id])
    end
  end
end
