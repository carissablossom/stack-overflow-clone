class Question < ActiveRecord::Base
  has_many :answers

  def upvote
    self.votes += 1
  end

  def downvote
    self.votes -= 1
  end
end
