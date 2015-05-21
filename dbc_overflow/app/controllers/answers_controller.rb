class AnswersController < ApplicationController

  def index
    @answer = Answer.new
    @question = Question.where(id: params[:question_id]).first
  end

  def create
    @answer = Answer.create(title: params[:answer][:title], text: params[:answer][:text], question_id: params[:question_id])
    redirect_to "/questions/#{@answer.question_id}"
  end


end
