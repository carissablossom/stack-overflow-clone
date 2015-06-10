class AddVoteTotalsToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :vote_totals, :integer, :default => 0, :null => false
  end
end
