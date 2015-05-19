class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user

  validates :user_id, presence: true
  validates :title,   presence: true
  validates :body,    presence: true
end
