class SpecialOffersController < ApplicationController
  
  def show
    @sp_offer = SpecialOffer.find(params[:id])
  end
end
