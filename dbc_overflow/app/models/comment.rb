class Comment < ActiveRecord::Base
  validates :user_id, :content, presence: true

  belongs_to :user
  belongs_to :commentable, polymorphic: true
end
