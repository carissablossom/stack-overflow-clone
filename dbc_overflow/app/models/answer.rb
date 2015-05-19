class Answer < ActiveRecord::Base
  belongs_to :question
  def upvote
    @question.vote_totals += 1
  end

  def downvote
    @question.vote_totals -= 1
  end
end
