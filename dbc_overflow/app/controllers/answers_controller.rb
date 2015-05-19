class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create

    @answer=Answer.new(answer_params)
    @question = Question.find(params[:question_id])
    @answer.save
    redirect_to "/questions/#{@question.id}/answers/#{@answer.id}"
  end

  def show
    @answers = Answer.all
    @question = Question.find(params[:id])
    @answer = Answer.find(params[:id])
  end

  private

  def answer_params
    params.require(:answer).permit(:title, :content)
  end

end
