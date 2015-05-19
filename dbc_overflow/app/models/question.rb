class Question < ActiveRecord::Base
  has_many :answers

  def upvote
  end

  def downvote
  end
end
