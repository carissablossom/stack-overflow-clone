class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content
      #t.references :answer #the reason that we did this is because ryan was adement on not dropping the database - instead we added this atribute/reltionship via an add migration table to establish that relationship
      t.timestamps
    end
  end
end
