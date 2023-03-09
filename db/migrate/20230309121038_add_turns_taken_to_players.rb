class AddTurnsTakenToPlayers < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :turns_taken, :integer, default: 0
  end
end
