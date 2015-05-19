class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    @question = Question.new
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

  def destroy
    Question.destroy(params[:id])
    redirect_to action: "index"
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update(param_check)
    redirect_to @question
  end

  private

  def param_check
    params.require(:question).permit(:title, :content)
  end

end


