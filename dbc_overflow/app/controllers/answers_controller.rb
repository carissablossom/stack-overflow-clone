class AnswersController < ApplicationController
  def index
    @answers = Answer.all
  end
  def create
    @answer = Answer.new(answer_params)
  end
  def new
    @answer = Answer.new
  end

  def show
  end

  private

  def answer_params
    params.require(:answers).permit(
    title: params[:title],
    content: params[:content],
    question_id: params[:question_id]
      )
  end
end
