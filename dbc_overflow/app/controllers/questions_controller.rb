class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.save

    redirect_to '/questions'
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.all
  end

  private
  def question_params
    params.required(:question).permit(:title, :content)
  end
end
