class AnswersController < ApplicationController
	def create
		@question = Question.find(params[:question_id])
		@answer = @question.answers.new(answer_params)

		if @answer.save
			redirect_to question_path(@question)
		else
			@error = @answer.errors.full_messages
			render 'questions/show'
		end
	end

	def update
    @answer = Answer.find(params[:id])
    if params[:commit] == "Upvote"
      @answer.votes += 1
      @answer.save
      redirect_to question_path(@answer)
    else params[:commit] == "Downvote"
      @answer.votes -= 1
      @answer.save
      redirect_to question_path(@answer)
    end
  end

	private
	def answer_params
		params.require(:answer).permit(:answer)
	end
end
