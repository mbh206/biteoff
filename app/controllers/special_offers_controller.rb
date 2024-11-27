class SpecialOffersController < ApplicationController

  def index
    @specialoffers = SpecialOffer.joins(:restaurant).where.not("restaurants.latitude IS null").limit(10)
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
end
