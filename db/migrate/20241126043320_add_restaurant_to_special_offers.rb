class AddRestaurantToSpecialOffers < ActiveRecord::Migration[7.1]
  def change
    add_reference :special_offers, :restaurant, null: false, foreign_key: true
  end
end
