class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
#  belongs_to :answerer, :class_name => :user
 # belongs_to :answerer, :foreign_key => :user_id
end
