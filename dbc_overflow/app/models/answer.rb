class Answer < ActiveRecord::Base
  include Votable

  belongs_to :question

end
