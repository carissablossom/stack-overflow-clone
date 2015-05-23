class AnswersController < ApplicationController

  def index
    @answer = Answer.new
    @question = Question.where(id: params[:question_id]).first
    @answer2 = Answer.where(question_id: params[:question_id])
    render json: {questions: @question, answers: @answer2}
  end

  def create
    @answer = Answer.create(title: params[:answer][:title], text: params[:answer][:text], question_id: params[:question_id])
    redirect_to "/questions/#{@answer.question_id}"
    # render json: {answers: @answer}
  end


end
