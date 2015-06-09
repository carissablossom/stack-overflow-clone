class QuestionsController < ApplicationController
  def index
    @questions= Question.all
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @answers =  @question.answers

  end

  def create
    @question = Question.new(question_params)  #question_params is a method will make private

  @question.save
  redirect_to questions_path
  end

  private
  def question_params
    params.require(:question).permit(:title, :content)
  end
end
