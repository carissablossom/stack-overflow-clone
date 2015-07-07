class QuestionTag < ActiveRecord::Base
  validates :user_id, :question_id, presence: true

  belongs_to :question
  belongs_to :tag
end
