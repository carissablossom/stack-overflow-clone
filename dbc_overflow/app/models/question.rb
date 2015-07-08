class Question < ActiveRecord::Base
  validates :user_id, :title, :content, presence: true

  belongs_to :user
  has_many :answers
  has_many :question_tags
  has_many :tags, through: :question_tags
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  has_many :favorite_questions
  has_many :favoriter, through: :favorite_questions, source: :user
  has_many :favorite_answers
  has_many :chosen, through: :favorite_answers, source: :answer

  def vote_count
    count = 0
    self.votes.each do |vote|
      count += vote.eval
    end
    return count
  end

  def tag_list
    tag_arr = Array.new
    self.tags.each do |tag|
      tag_arr << tag.name
    end
    return tag_arr.join(", ")
  end

end
