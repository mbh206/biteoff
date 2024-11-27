class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @special_offer = SpecialOffer.find(params[:special_offer_id])
  end
end
