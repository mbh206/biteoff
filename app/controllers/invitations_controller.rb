class InvitationsController < ApplicationController

  before_action :set_invitation, only: [:update]

  #before_action set_invitation
  def update

    #if the invitation is accepted we update it, otherwise it's destroyed 
    if(params[:invitation][:confirmed].downcase == "true")   
      if @invitation.update!(confirmed: params[:invitation][:confirmed])
        redirect_to user_path(current_user)
      else
        redirect_to user_path(current_user), status: :unprocessable_entity  
      end
    else
      #destroy the invitation 
      Invitation.destroy(params[:id].to_i)
    end
  end

  def create
    
      friend_id =  params[:invitation][:friend_id].to_i
      #if the current is already friend with the selected user
      if (!current_user.friend_with?(User.find(friend_id)))
        @invitation = Invitation.new(
          user_id: current_user.id, 
          friend_id: friend_id 
        )
        if @invitation.save!
          redirect_to user_path(current_user)
        else
          redirect_to user_path(current_user), status: :unprocessable_entity
        end
      else
        redirect_to user_path(current_user), notice: "Already friends!"
      end
  end

  private

  def set_invitation
    @invitation = Invitation.find(params[:id])
  end

  def invitation_params
    params.require(:invitation).permit(:user_id, :friend_id, :confirmed)
  end
end
