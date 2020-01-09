class CreateChallengeStatements < ActiveRecord::Migration[6.0]
  def change
    create_table :challenge_statements do |t|
      t.string :title
      t.string :partner_name
      t.text :description
      t.boolean :is_open, default: true
      t.timestamps
    end
  end
end
