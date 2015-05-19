class AddVoteTotalsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :vote_totals, :integer, :null => false, :default => 0
  end
end
