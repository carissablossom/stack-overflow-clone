class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content
      t.references :user, index: true, foreign_key: true
      #is this the same as vvv
      t.timestamps null: false
    end
      #add_foreign_key :questions, :users
  end
end
