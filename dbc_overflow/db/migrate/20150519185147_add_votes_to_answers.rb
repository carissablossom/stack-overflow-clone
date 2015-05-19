class AddVotesToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :vote_total, :integer, default: 0
    add_index :answers, :vote_total
  end
end
