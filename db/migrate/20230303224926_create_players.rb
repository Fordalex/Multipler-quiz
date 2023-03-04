class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :score, default: 0
      t.references :room, null: false, foreign_key: true
      t.boolean :questioner
      t.string :answer

      t.timestamps
    end
  end
end
