class AddVoteCounterToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :vote_counter, :integer
  end
end
