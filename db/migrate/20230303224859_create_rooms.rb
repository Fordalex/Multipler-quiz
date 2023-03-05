class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.datetime :question_start_time
      t.string :room_id

      t.timestamps
    end
  end
end
