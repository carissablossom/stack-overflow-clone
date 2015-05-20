class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user
  has_many :votes

  validates :title,   presence: true
  validates :body,    presence: true
end
