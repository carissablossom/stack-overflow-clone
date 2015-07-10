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
    p params
    p "^" * 100
    @answer = Answer.find(params[:id])
    @answer.votes += 1 if params[:vote] == "Upvote"
    @answer.votes -= 1 if params[:vote] == "Downvote"
    @answer.save
    render :json => {:vote => @answer.votes, :id => @answer.id}
  end

	private
	def answer_params
		params.require(:answer).permit(:answer)
	end
end
