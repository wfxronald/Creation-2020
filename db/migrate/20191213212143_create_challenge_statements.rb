class CreateChallengeStatements < ActiveRecord::Migration[6.0]
  def change
    create_table :challenge_statements do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
