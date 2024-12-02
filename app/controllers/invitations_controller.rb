class InvitationsController < ApplicationController

  def update
    #retrieving the invitation we want to accept/reject
    @invitation = Invitation.find(params[:id])

    #if the invitation is accepted we update it, otherwise it's destroyed 
    if(params[:invitation][:confirmed])   
      if @invitation.update!(confirmed: params[:invitation][:confirmed])
        redirect_to user_path(current_user), notice: "Invitation confirmed"
      else
      redirect_to user_path(current_user), status: :unprocessable_entity  
      end
    else
      puts 
      #destroy the invitation 
      Invitation.destroy(params[:id])
    end
  end

end
