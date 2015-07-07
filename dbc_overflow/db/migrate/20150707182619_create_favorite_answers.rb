class CreateFavoriteAnswers < ActiveRecord::Migration
  def change
    create_table :favorite_answers do |t|
      t.integer :question_id
      t.integer :answer_id
      t.datetime :favorited_date

      t.timestamps null: false
    end
  end
end
