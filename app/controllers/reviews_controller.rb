class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @special_offer = SpecialOffer.find(params[:special_offer_id])
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @special_offer = SpecialOffer.find(params[:special_offer_id])
    @review.special_offer = @special_offer
    if @review.save
      redirect_to special_offer_path(@special_offer)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating, photos: [])
  end
end
