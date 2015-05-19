class Question < ActiveRecord::Base
  has_many :answers

  def upcount
    self.upvote += 1
    self.save
  end

  def downcount
    self.downvote += 1
    self.save
  end
end
