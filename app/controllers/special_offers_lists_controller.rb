class SpecialOffersListsController < ApplicationController

  def new
    @special_offers_list = SpecialOffersList.new
    @special_offer = SpecialOffer.find(params[:special_offer_id])
  end

  def create
    @special_offers_list = SpecialOffersList.new(special_offers_list_params)
    @special_offers_list.user = current_user
    @special_offer = SpecialOffer.find(params[:special_offer_id])

    if @special_offers_list.save!
      @offers_collection = OffersCollection.create!(
        special_offer: @special_offer,
        special_offers_list: @special_offers_list
      )
      redirect_to user_path(current_user)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def special_offers_list_params
    params.require(:special_offers_list).permit(:name)
  end
end
