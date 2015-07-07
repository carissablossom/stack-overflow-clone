class QuestionTag < ActiveRecord::Base
  validates :question_id, :tag_id, presence: true

  belongs_to :question
  belongs_to :tag
end
