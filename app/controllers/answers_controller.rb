class AnswersController < ApplicationController
	def create
    p '*' * 90
    p params
    p '*' * 90
		@question = Question.find(params[:question_id])
		@answer = @question.answers.new(answer_params)

		if @answer.save
      p @answer
      render partial: 'answer', layout: false, locals: {answer: @answer}
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
      redirect_to question_path(@answer.question)
    else params[:commit] == "Downvote"
      @answer.votes -= 1
      @answer.save
      redirect_to question_path(@answer.question)
    end
  end

	private
	def answer_params
		params.require(:answer).permit(:answer)
	end
end
