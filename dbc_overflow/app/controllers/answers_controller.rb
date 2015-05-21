class AnswersController < ApplicationController
  # def index
  #   @answers = Answer.all
  # end
  # def show
  #   @answer = Answer.new()
  # end
  def create
    @answer = Answer.new(title: params["answer"][:title], content:params["answer"][:content], question_id:params[:question_id])
    @answer.save
    redirect_to "/questions/#{@answer.question_id}"
  end

  def new
    @answer = Answer.new(params[:title], params[:content])
    if @answer.save
      redirect_to @answer
    else
      render new
    end
  end

  def show
  end

  private
  def answer_params
    params.require(:answer).permit(:title, :content, :question_id)
  end
end
