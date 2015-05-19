class AddVoteCounterToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :vote_counter, :integer, default => 0
  end
end
