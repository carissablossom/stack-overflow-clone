class AddUpvoteToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :upvote, :integer, :default => 0
  end
end
