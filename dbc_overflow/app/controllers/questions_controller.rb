class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(post_params)
    @question.save
    redirect_to action: "index"
  end

  def show
    @question = Question.where(id: params[:id]).first
  end

  private

  def post_params
    params.require(:question).permit(:title, :content)
  end

end
