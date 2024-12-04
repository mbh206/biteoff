class AddOrganizerToVotingSessions < ActiveRecord::Migration[7.1]
  def change
    add_reference :voting_sessions, :user, foreign_key: true
  end
end
