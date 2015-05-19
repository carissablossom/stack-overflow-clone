class QuestionsController < ApplicationController
  def index
    @question = Question.all
    # @question = Question.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.save
    redirect_to questions_path
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
    params.require(:questions).permit(
      :title,
      :content)
  end


end
