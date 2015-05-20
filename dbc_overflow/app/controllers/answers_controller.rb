class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.save
    redirect_to "/questions/#{@question.id}/answers/#{@answer.id}"
  end

  def show
    @answer = Answer.find(params[:id])
  end

  # def upvote
  #   @question.vote_totals += 1
  # end

  # def downvote
  #   @question.vote_totals -= 1
  # end
  private

  def answer_params
    params.require(:answer).permit(:title, :content, :question_id)
  end

end
