class AddVotesToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :vote_total, :integer, default: 0
    add_index :questions, :vote_total
  end
end
