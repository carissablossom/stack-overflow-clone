class Question < ActiveRecord::Base
  has_many :answers

  def upvote
    self.point_count +=1
  end

  def downvote
    self.point_count -=1
  end
end
