class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  validates :answer, presence: true

  acts_as_votable
end
