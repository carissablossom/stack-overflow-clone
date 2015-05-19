class QuestionsController < ApplicationController
  def create
    @question = Question.new(post_params)
    @question.save
    redirect_to :back
     # redirect_to :action => :index
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.where(id: params[:id]).first
    @answers = @question.answers
    @answer = Answer.new
  end

  def index
    @question = Question.new
    @questions = Question.all
    @answers = Answer.all
  end

  private
  def post_params
    params.require(:question).permit(:title, :content)
  end
end
