class Question < ActiveRecord::Base
  validates :title, :content, presence: true
  has_many :answers

  before_save :default_vote_count


  def default_vote_count
    self.vote_counter ||= 0
  end

end
