class QuestionsController < ApplicationController
  def index
    @question = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.save
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
    # @answers = @question.answers
  end


  def edit
  end

private
  def question_params
    params.require(:question).permit(
      :title,
      :content)
  end


end
