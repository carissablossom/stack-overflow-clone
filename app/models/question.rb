class Question < ActiveRecord::Base
  belongs_to :user
  has_many   :answers

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true, uniqueness: true

end
