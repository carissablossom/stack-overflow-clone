class Answer < ActiveRecord::Base
  belongs_to :question
  #belongs_to :user
  def up_vote
  	self.votes += 1
  	save!
  end
  def down_vote
  	self.votes -= 1
  	save!
  end
end
