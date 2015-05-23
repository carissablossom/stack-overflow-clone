class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :title
      t.text :content
      t.belongs_to :question
      t.integer :vote, default: 0


      t.timestamps
    end
  end
end
