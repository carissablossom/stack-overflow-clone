class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params[:question_id]
    @answer.save

    redirect_to "/questions/#{params[:question_id]}"
  end

  def show
    @answer = Answer.find(params[:id])
  end

  private
  def answer_params
    params.required(:answer).permit(:title, :content)
  end
end
