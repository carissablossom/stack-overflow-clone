
class Question < ActiveRecord::Base
  has_many :answers

  before_save :default_vote_count

  def default_vote_count
    self.vote_count ||= 0
  end

end
