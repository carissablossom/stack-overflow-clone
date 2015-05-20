class Question < ActiveRecord::Base
  has_many :answers

  def upvote
    self.votes += 1
    self.save
  end

  def downvote
    self.votes -= 1
    self.save
  end
end
