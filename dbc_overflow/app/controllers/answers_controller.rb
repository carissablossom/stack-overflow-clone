class AnswersController < ApplicationController

  def index
    @answer = Answer.new
    @question = Question.where(id: params[:question_id]).first
  end

  def create
    @answer = Answer.create(title: params[:answer][:title], text: params[:answer][:text])
    redirect_to question_answers_path(@answer.question_id)
  end




end
