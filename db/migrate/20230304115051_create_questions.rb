class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :question
      t.text :options
      t.integer :incorrect_answers, default: 1

      t.timestamps
    end
  end
end
