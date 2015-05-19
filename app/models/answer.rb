class Answer < ActiveRecord::Base
  belongs_to :question
  validates_presence_of :title, :content, :question_id
  validates :vote_count, numericality: { greater_than_or_equal_to: 0 }
end
