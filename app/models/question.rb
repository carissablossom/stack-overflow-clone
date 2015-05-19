class Question < ActiveRecord::Base
  has_many :answers
  validates_presence_of :title, :content
  validates :vote_count, numericality: { greater_than_or_equal_to: 0 }
end
