class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answers = Answer.where(question_id: @question.id)
  end

  def create
    @question = Question.new(question_params)
    @question.save
    redirect_to '/questions'
  end

  private
  def question_params
    params.require(:question).permit(:title, :content)
  end

end
