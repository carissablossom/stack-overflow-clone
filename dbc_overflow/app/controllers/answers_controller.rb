class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.save
  end

  def show
    @answer = Answer.find(params[:id])
  end

  private
  def answer_params
    params.required(:answer).permit(:title, :content, :question_id)
  end
end
