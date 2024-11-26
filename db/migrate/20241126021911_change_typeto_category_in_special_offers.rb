class ChangeTypetoCategoryInSpecialOffers < ActiveRecord::Migration[7.1]
  def change
    rename_column :special_offers, :type, :category
  end
end
