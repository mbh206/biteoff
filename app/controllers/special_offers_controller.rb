class SpecialOffersController < ApplicationController

  def index
    if params[:query].present?
      user_input = params[:query]
      unless Restaurant::CATEGORIES.include?(user_input)
        results = Geocoder.search(user_input)
        @coordinates = results.first.coordinates
      else
        @specialoffers = SpecialOffer.joins(:restaurant).where("restaurants.category ILIKE ?", "%#{user_input}%")
      end
    else
      if params[:lat].present? && params[:long].present?
      restaurants = Restaurant.near([params[:lat], params[:long]], 2)
      @specialoffers = SpecialOffer.joins(:restaurant).where(restaurant: {id: restaurants.map(&:id)})
      else
        @specialoffers = SpecialOffer.joins(:restaurant).where.not("restaurants.latitude IS null").limit(101)
      end
    end
    @markers = @specialoffers.map do |specialoffer|
      {
        lat: specialoffer.restaurant.latitude,
        lng: specialoffer.restaurant.longitude,
        name: specialoffer.restaurant.name,
        offer: specialoffer.category,
        id: specialoffer.id,
        description: specialoffer.description,
        starting: specialoffer.start_date,
        marker_html: render_to_string(partial: "marker", locals: {specialoffer: specialoffer})
      }
    end
  end

  def show
    @sp_offer = SpecialOffer.find(params[:id])
    @markers = {
        lat: @sp_offer.restaurant.latitude,
        lng: @sp_offer.restaurant.longitude
      }
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


  def special_offer_params
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
