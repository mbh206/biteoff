class CreateOffersCollections < ActiveRecord::Migration[7.1]
  def change
    create_table :offers_collections do |t|
      t.references :special_offer, null: false, foreign_key: true
      t.references :special_offers_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
