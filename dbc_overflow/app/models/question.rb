class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  validates_presence_of :title, :content

  def upcount
    self.upvote += 1
    self.save
  end

  def downcount
    self.downvote += 1
    self.save
  end
end
