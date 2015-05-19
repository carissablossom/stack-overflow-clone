class Question < ActiveRecord::Base
  has_many :answers

  def up_vote
    self.vote_total += 1
    self.save
  end

  def down_vote
    self.vote_total -= 1
    self.save
  end
end
