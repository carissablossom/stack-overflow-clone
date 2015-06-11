class Question < ActiveRecord::Base
  has_many :answers
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
