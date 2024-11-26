class AddConfirmationCountToSpecialOffers < ActiveRecord::Migration[7.1]
  def change
    add_column :special_offers, :confirmation_count, :integer
  end
end
