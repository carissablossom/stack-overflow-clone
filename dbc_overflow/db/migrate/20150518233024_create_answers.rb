class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :user
      t.belongs_to :question
      t.text :body
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
