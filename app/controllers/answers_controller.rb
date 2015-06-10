class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    @answer.save
    redirect_to question_path(@question)
  end

  def upvote
    @answer = Answer.find(params[:id])
    @answer.vote_totals += 1
    @answer.save
    @question = Question.find(@answer.question_id)
    redirect_to question_path(@question)
  end

  def downvote
    @answer = Answer.find(params[:id])
    @answer.vote_totals -= 1
    @answer.save
    @question = Question.find(@answer.question_id)
    redirect_to question_path(@question)
  end

  private
    def answer_params
      params.require(:answer).permit(:title, :content)
    end
end

