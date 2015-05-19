class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :user
      t.string :title
      t.text :body
      t.integer :votes, default: 0

      t.timestamps
    end
  end
end
