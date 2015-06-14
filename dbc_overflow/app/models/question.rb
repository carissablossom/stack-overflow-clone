class Question < ActiveRecord::Base
  include Votable

  has_many :answers
  validates :title, :content, presence: true

end
