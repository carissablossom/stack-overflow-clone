class AnswersController < ApplicationController
	include AnswersHelper

	def create
		@question = Question.where(id: params[:question_id]).first
		@answer =Answer.new(answer_params)
		@answer.question_id = @question.id
		@answer.votes = 0
		@answer.save
		redirect_to question_path(@answer.question_id)
	end
	def up_vote
	answer_find	
    @answer.up_vote
    redirect_to :back
  	end

  	def down_vote
  	answer_find
  	 @answer.down_vote
   	redirect_to :back
  	end
	private
  	def answer_params
    params.require(:answer).permit(:title, :content, :question_id)
  end
end
