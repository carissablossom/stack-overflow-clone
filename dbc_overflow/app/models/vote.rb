class Vote < ActiveRecord::Base
  validates :user_id, :eval, presence: true

  belongs_to :user
  belongs_to :voteable, polymorphic: true
end
