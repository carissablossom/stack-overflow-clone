class Tag < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :question_tags
  has_many :questions, through: :question_tags
end
