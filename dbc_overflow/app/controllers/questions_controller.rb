class QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.save
    redirect_to "/questions/#{@question.id}"
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def index
    @question = Question.new
    @questions = Question.all
  end

  private
  def question_params
    params.require(:question).permit(:title, :content)
  end

end
