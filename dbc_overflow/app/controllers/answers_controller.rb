class AnswersController < ApplicationController

  def index
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(param_check)
    @answer.question_id = params[:question_id]
    @answer.save
    @question = @answer.question
    redirect_to @question
    # render 'questions/show' I think this is the same as above.
  end

  private

  def param_check
    params.require(:answer).permit(:title, :content)
  end
end
