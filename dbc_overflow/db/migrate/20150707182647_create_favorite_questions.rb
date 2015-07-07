class CreateFavoriteQuestions < ActiveRecord::Migration
  def change
    create_table :favorite_questions do |t|
      t.integer :user_id
      t.integer :question_id
      t.datetime :favorited_date

      t.timestamps null: false
    end
  end
end
