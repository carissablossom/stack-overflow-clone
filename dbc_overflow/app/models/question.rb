class Question < ActiveRecord::Base
  has_many :answers
  has_many :question_votes

  validates_presence_of :title, :content
end
