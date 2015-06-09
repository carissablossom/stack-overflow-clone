class AddReferenceToAnswers < ActiveRecord::Migration
  def change
    #add_column :answers, :question_id, :integer
    add_reference :answers, :question, index: true, foreign_key: true
  end
end
