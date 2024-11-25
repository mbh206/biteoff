class CreateSpecialOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :special_offers do |t|
      t.string :type
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.date :start_date
      t.date :end_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
