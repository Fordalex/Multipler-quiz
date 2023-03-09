class AddRoundsToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :rounds, :integer, default: 1
    add_column :rooms, :current_round, :integer, default: 1
  end
end
