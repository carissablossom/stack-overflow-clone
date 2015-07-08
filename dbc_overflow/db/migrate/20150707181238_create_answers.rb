class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :reply
      t.string :commenter

      t.references :post, index: true

      t.timestamps null: false
    end
  end
end
