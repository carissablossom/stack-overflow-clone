class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes

  # validates :question_id, presence: true
  # validates :body, presence: true
end
