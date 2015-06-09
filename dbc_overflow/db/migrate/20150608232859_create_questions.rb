class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content
      #t.references :answer
      t.timestamps
    end
  end
end
