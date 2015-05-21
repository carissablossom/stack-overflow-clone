class Answer < ActiveRecord::Base
   validates :content, presence: true
  belongs_to :question

  before_save :default_vote_count

  def default_vote_count
    self.vote_counter ||= 0
  end
end
