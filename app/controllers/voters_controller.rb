class VotersController < ApplicationController
  def create
    unless Voter.find_by(
      user_id: voter_params[:user_id],
      voting_session_id: voter_params[:voting_session_id]
      )
      @voter = Voter.new(voter_params)
      if @voter.save!
        redirect_to voting_session_path(VotingSession.where(id_users: current_user))
      else
        #chaf: not sure about that way of retrieving the VotingSession
        redirect_to voting_session_path(VotingSession.where(id_users: current_user)), status: :unprocessable_entity
      end
    end
  end

  def destroy
    voter = Voter.find(params[:id])

    if voter.destroy
      # Fetch the voting session from the voter record
      redirect_to voting_session_path(voter.voting_session_id), notice: 'Voter removed successfully.'
    else
      redirect_to voting_session_path(voter.voting_session_id), alert: 'Failed to remove voter.'
    end
  end

  private

  def voter_params
    params.require(:voter).permit(:user_id, :voting_session_id)
  end

end
