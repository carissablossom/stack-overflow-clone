class FavoriteQuestion < ActiveRecord::Base
  validates :user_id, :question_id, :favorited_date, presence: true

  belongs_to :user
  belongs_to :question
end
