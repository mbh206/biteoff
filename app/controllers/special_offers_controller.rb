class SpecialOffersController < ApplicationController

  def index
    @restaurants = Restaurant.all
    @markers = @restaurants.geocoded.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude
      }
    end

  def show
    @sp_offer = SpecialOffer.find(params[:id])
  end
end
