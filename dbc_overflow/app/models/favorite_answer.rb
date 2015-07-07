class FavoriteAnswer < ActiveRecord::Base
  validates :question_id, :answer_id, :favorited_date, presence: true

  belongs_to :question
  belongs_to :answer
end
