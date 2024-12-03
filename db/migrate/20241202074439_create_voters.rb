class CreateVoters < ActiveRecord::Migration[7.1]
  def change
    create_table :voters do |t|
      t.references :user, null: false, foreign_key: true
      t.references :voting_session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
