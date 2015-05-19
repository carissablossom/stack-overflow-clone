class Answer < ActiveRecord::Base
  belongs_to :question
  validates :votes, :numericality => { greater_than_or_equal_to: 0 }
end
