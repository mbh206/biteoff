class AddPolltoVotes < ActiveRecord::Migration[7.1]
  def change
    add_column :votes, :poll, :integer, default: 0
  end
end
