class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params[:id]
    @answer.save
    redirect_to "/questions"
  end

  private
  def answer_params
    params.require(:answer).permit(:content)
  end


end
