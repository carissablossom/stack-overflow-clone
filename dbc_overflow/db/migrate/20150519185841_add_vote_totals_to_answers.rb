class AddVoteTotalsToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :vote_totals, :integer, :null => false, :default => 0
  end
end
