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

  private

  def param_check
    params.require(:question).permit(:title, :content)
  end

end


