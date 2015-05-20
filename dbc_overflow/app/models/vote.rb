class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  belongs_to :answer

  validates :total, inclusion: {
    in: -1..1,
    message: "The votes must be between -1 and 1"
  }

end
