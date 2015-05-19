class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @question = Question.new
  end

  def show
    @question = Question.where(id: params[:id]).first
    @answer_set = @question.answers
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def destroy
    @question = Question.where(id: params[:id]).first
    @question.destroy
    # redirect_to action: 'index', status: 303
    redirect_to :index
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

  def edit
    @question = Question.where(id: params[:id]).first
  end

  private
  def question_params
    params.require(:question).permit(:title,:content)
  end
end
