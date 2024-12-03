class CollectionsController < ApplicationController

    def new
      @collection = Collection.new
      @special_offer = SpecialOffer.find(params[:special_offer_id])
      @special_offers_list = current_user.special_offers_list
    end
  
    # def create
    #   @collection = Collection.new
    #   @collection.special_offer = SpecialOffer.find(params[:special_offer_id])
    #   @collection.special_offers_list = SpecialOffersList.find(collection_params[:special_offers_list])
    #   if @collection.save!
    #     redirect_to user_path(current_user)
    #   else
    #     render 'new', status: :unprocessable_entity
    #   end
    # end
  
    def create
      
      @collection = Collection.new(collection_params)

      if @collection.save!
        redirect_to voting_session_path(VotingSession.where(id_users: current_user))
      else 
        redirect_to voting_session_path(VotingSession.where(id_users: current_user)), status: :unprocessable_entity
      end
    end
  
    private
  
    def collection_params
      params.require(:collection).permit(:special_offer_id, :voting_session_id)
    end
    
end
