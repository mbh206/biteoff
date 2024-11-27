class SpecialOffersController < ApplicationController

  def index
    @specialoffers = SpecialOffer.joins(:restaurant).where.not("restaurants.latitude IS null").limit(101)
    @restaurants = Restaurant.all
    @markers = @specialoffers.map do |specialoffer|
      {
        lat: specialoffer.restaurant.latitude,
        lng: specialoffer.restaurant.longitude
      }
    end
  end

  def show
    @sp_offer = SpecialOffer.find(params[:id])
  end

  def new
    @specialoffer = SpecialOffer.new
  end

  def create
    @special_offer = SpecialOffer.new(offer_params)
    @special_offer.user = current_user
    @special_offer.confirmation_count = 0
    @special_offer.restaurant = Restaurant.find(params[:special_offer][:restaurant_id])
    if @special_offer.save
      redirect_to special_offer_path(@special_offer)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def offer_params
    params.require(:special_offer).permit(
      :restaurant,
      :category,
      :description,
      :start_date,
      :end_date,
      :start_time,
      :end_time,
      photos: [])
  end
end
