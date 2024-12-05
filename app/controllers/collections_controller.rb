class CollectionsController < ApplicationController

    def new
      @collection = Collection.new
      @special_offer = SpecialOffer.find(params[:special_offer_id])
      @special_offers_list = current_user.special_offers_list
    end

    def create
      @voting_session = VotingSession.find(params[:collection][:voting_session_id])
      @special_offer = SpecialOffer.find(params[:collection][:special_offer_id])
      @collection = @voting_session.collections.find_by(special_offer_id: params[:collection][:special_offer_id])
      if @collection.nil?
        @collection = Collection.new(collection_params)
        if @collection.save!
          redirect_to voting_session_path(@collection.voting_session)
        else
          redirect_to voting_session_path(@collection.voting_session), status: :unprocessable_entity
        end
      else
        redirect_to voting_session_path(@voting_session)
      end

    end

    private

    def collection_params
      params.require(:collection).permit(:special_offer_id, :voting_session_id)
    end

end
