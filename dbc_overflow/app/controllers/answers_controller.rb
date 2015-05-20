class AnswersController < ApplicationController
  def new
  end

  def create
    @answer = Answer.new(question_id: params[:question_id], body: params[:answer][:body])
    p params
    puts '*' * 50
    p params[:answer][:body]
    @answer.save
    redirect_to :back
    # redirect_to "/questions/#{@answer.question_id}"

  end

  def show
  end
end
