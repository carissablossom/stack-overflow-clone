class Vote < ActiveRecord::Base
  validates :user_id, :evaluation, presence: true

  belongs_to :user
  belongs_to :voteable, polymorphic: true
end
