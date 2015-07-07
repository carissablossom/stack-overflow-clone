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

	def upvote
		@question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])

    @answer.upvote_by current_user #unless current_user.id == @answer.user_id - need to set up sessions for answers
    redirect_to question_path(@question)
  end

  def downvote
		@question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])

    @answer.downvote_from current_user #unless current_user.id == @answer.user_id - need to set up sessions for answers
    redirect_to question_path(@question)
  end

	private
	def answer_params
		params.require(:answer).permit(:answer)
	end
end
