class Question < ActiveRecord::Base
  has_many :answers
  validates :votes, :numericality => { greater_than_or_equal_to: 0 }
end
