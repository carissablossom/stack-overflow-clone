class AnswersController < ApplicationController
  def index
    @answers = Answer.all
  end
  def create
    @answer = Answer.create(
      title:params[:title],
      content: params[:content],
      question_id: params[:id])
  end
  def new
    @answer = Answer.new
  end

  def show
  end
end
