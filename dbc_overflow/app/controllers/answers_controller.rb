class AnswersController < ApplicationController
	def patch
		
	end

	def create
		@question = Question.where(id: params[:question_id]).first
		@answer =Answer.new(answer_params)
		@answer.question_id = @question.id
		@answer.save
		p "*" * 100
		p @answer.question_id
		redirect_to question_path(@answer.question_id)
	end
	private
  	def answer_params
    params.require(:answer).permit(:title, :content, :question_id)
  end
end
