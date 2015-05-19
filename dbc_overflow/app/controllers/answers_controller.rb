class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.save
    redirect_to "/questions/#{@question.id}"
  end


  private
  def answer_params
    params.require(:answer).permit(:content)
  end


end
