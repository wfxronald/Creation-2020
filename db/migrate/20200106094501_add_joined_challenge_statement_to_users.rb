class AddJoinedChallengeStatementToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :joined_challenge_statement, :integer, array: true, default: []
  end
end
