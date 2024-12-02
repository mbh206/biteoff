class CreateVotingSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :voting_sessions do |t|
      t.integer :status

      t.timestamps
    end
  end
end
