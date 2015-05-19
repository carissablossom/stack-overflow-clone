class AddDownvoteToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :downvote, :integer, :default => 0
  end
end
