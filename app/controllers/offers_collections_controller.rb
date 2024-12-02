class OffersCollectionsController < ApplicationController

  def new
    @offers_collection = OffersCollection.new
    @special_offer = SpecialOffer.find(params[:special_offer_id])
    @special_offers_list = current_user.special_offers_list
  end

  def create
    @offers_collection = OffersCollection.new
    @offers_collection.special_offer = SpecialOffer.find(params[:special_offer_id])
    @offers_collection.special_offers_list = SpecialOffersList.find(offers_collection_params[:special_offers_list])
    if @offers_collection.save!
      redirect_to user_path(current_user)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def offers_collection_params
    params.require(:offers_collection).permit(:special_offers_list)
  end
end
