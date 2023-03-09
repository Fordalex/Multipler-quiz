class CreateRoundScore < ActiveRecord::Migration[6.1]
  def change
    create_table :round_scores do |t|
      t.references :player, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.integer :round
      t.integer :score

      t.timestamps
    end
  end
end
