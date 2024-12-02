class AddUserToSpecialOffersLists < ActiveRecord::Migration[7.1]
  def change
    add_reference :special_offers_lists, :user, null: false, foreign_key: true
  end
end
