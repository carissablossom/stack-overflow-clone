class AnswersController < ApplicationController
  def index
    @answers = Answer.all
  end
  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params[:question_id]
    @answer.save

    redirect_to "/questions/#{params[:question_id]}"
  end
  def new
    @answer = Answer.new
  end

  def show

  end

  private

  def answer_params
    params.require(:answer).permit(
    :title,
    :content,
    :question_id)

  end
end
