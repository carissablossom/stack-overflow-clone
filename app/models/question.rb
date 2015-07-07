class Question < ActiveRecord::Base
  belongs_to :user
  has_many   :answers

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true, uniqueness: true

  acts_as_votable

  def score
    self.get_upvotes.size - self.get_downvotes.size
  end

end
