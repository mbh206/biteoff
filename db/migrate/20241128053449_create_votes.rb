class CreateVotes < ActiveRecord::Migration[7.1]
  def change
    create_table :votes do |t|
      t.references :voting_session, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :special_offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
