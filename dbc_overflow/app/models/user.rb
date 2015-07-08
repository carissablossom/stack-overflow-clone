require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes
  has_many :favorite_questions
  has_many :favorites, through: :favorite_questions, source: :question


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
