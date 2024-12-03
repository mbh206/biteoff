class AddDefaultValuetoVotingSessions < ActiveRecord::Migration[7.1]
  def change
    change_column_default :voting_sessions, :status, 0
  end
end
