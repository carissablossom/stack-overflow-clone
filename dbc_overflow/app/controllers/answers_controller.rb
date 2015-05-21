class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params[:question_id]
    @answer.save
    redirect_to question_path(@answer.question_id)
  end

  def upvote
    answer = Answer.find(params[:id])
    answer.votes += 1
    answer.save
    redirect_to question_path(params[:question_id])
  end

  def downvote
    answer = Answer.find(params[:id])
    answer.votes -= 1
    answer.save
    redirect_to question_path(params[:question_id])
  end

  def show
    @answer = Answer.find(params[:id])
  end

  private
  def answer_params
    params.require(:answer).permit(:title, :content)
  end
end
