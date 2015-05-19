class AddUpvoteToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :upvote, :integer, :default => 0
  end
end
