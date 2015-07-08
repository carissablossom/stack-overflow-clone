class Answer < ActiveRecord::Base
  validates :user_id, :question_id, :content, presence: true

  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  has_many :favorite_answers

  def vote_count
    count = 0
    self.votes.each do |vote|
      count += vote.eval
    end
    return count
  end
end
