class Comment < ActiveRecord::Base
  validates :user_id, :content, :commentable_id, presence: true

  belongs_to :user
  belongs_to :commentable, polymorphic: true
end
