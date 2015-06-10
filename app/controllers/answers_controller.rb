class AnswersController < ApplicationController
  include AnswerHelper

  def create
    @answer = Answer.new(answer_params)
    @answer.question = Question.find(params[:question_id])
    @answer.save
   #hitting the route targeted in the form invokes this block of code in the create method
    redirect_to @answer.question
  end



  private
  def answer_params
    params.require(:answer).permit(:content)
  end
end
