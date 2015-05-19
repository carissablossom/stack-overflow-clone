class QuestionsController < ApplicationController
  def new
    @questions = Question.all
  end

  def create
    @question = Question.new(question_params)

  if @question.save
    redirect_to @question
  else
    render 'new'
  end
end

  def index
    @question = Question.all
  end

  private

  def question_params
    params.require(:question).permit(:title, :text)
  end

  def show
    @question = Question.find(params[:id])
  end

end
