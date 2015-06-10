class AddVoteTotalsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :vote_totals, :integer, :default => 0, :null => false
  end
end
