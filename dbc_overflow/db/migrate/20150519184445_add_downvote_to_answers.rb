class AddDownvoteToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :downvote, :integer, :default => 0
  end
end
