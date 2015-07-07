class Vote < ActiveRecord::Base
  validates :user_id, :evaluation, :voteable_id, presence: true

  belongs_to :user
  belongs_to :voteable, polymorphic: true
end
