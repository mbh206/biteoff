class CreateVotingSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :voting_sessions do |t|
      t.references :special_offers_list, null: false, foreign_key: true
      t.references :friend_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
