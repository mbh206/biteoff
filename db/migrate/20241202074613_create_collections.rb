class CreateCollections < ActiveRecord::Migration[7.1]
  def change
    create_table :collections do |t|
      t.references :special_offer, null: false, foreign_key: true
      t.references :voting_session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
