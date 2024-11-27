class AddTimetoSpecialOffers < ActiveRecord::Migration[7.1]
  def change
    change_column :special_offers, :start_time, :time
    change_column :special_offers, :end_time, :time
  end
end
