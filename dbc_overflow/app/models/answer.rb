class Answer < ActiveRecord::Base
  validates_presence_of :title, :content, :question_id
  belongs_to :question
end
