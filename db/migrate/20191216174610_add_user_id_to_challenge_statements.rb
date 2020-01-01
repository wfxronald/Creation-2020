class AddUserIdToChallengeStatements < ActiveRecord::Migration[6.0]
  def change
    add_column :challenge_statements, :user_id, :integer
  end
end
