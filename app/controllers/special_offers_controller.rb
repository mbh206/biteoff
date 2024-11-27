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

  def update
    puts "Updating special offer count..."
    @offer = SpecialOffer.find(params[:id])
    @offer.confirmation_count += 1
    if @offer.save!
      redirect_to special_offer_path(@offer) 
    else
      #not sure about that 
      redirect_to special_offer_path(@offer), status: :unprocessable_entity
    end
  end

  private

  def special_offer_params
    params.require(:special_offer).permit(
      :confirmation_count,
      :category,
      :description,
      :start_time,
      :end_time,
      :start_date,
      :end_date)
    
  end

end
