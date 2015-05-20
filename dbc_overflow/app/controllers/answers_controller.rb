class AnswersController < ApplicationController
  def new
  end

  def create
    @answer = Answer.new(question_id: params[:question_id], body:params[:body])
    p params
    @answer.save

    redirect_to '/'

  end

  def show
  end
end
