class Question < ActiveRecord::Base
  has_many :answers
  def upvote
    @question.vote_totals += 1
  end

  def downvote
    @question.vote_totals -= 1
  end
end
