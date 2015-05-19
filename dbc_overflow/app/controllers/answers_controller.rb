class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to(:back)
    else
      status 400
      'bad answer data'
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:title,:content,:question_id)
  end
end
