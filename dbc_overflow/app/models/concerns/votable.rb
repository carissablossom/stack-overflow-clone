module Votable
  extend ActiveSupport::Concern
  included do
    has_many :votes, :as => :votable
  end

  def total_votes
    self.votes.sum(:value)
  end

end
