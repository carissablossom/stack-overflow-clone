class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.where(id: params[:id]).first
    @answer_set = @question.answers
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to action: 'index', status: 303
    else
      status 400
      'bad question data'
    end
  end

  private
  def question_params
    params.require(:question).permit(:title,:content)
  end
end
