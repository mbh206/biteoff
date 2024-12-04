class VotingSessionsController < ApplicationController
  def csib

      @voting_session = VotingSession.new
      @voting_session.user = current_user
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
    @voting_session = VotingSession.find(params[:id])

    @voter = Voter.new
    @collection = Collection.new
    @vote = Vote.new
  end

  def update
    @voting_session = VotingSession.find(params[:id])
    if @voting_session.update(voting_session_params)
      redirect_to voting_session_path(params[:id]) 
    else
      render 'show', status: :unprocessable_entity
    end
  end

  private
  
  def voting_session_params
    params.require(:voting_session).permit(:status)
  end
  
end
