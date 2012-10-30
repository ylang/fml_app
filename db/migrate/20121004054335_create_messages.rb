class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.string :content
      t.integer :score
      t.string :challenge_question
      t.string :anwser

      t.timestamps
    end
  end
end
