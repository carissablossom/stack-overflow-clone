class Answer < ActiveRecord::Base
  belongs_to :question

  def upvote
    self.point_count +=1
  end

  def downvote
    self.point_count -=1
  end
end
