class User < ActiveRecord::Base
  acts_as_voter

  has_many :questions
  has_many :answers

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 6}
end
