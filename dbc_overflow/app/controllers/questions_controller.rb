class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(param_check)
    @question.save
    redirect_to @question
  end

  private

  def param_check
    params.require(:question).permit(:title, :content)
  end

end


