class AnswersController < ApplicationController
  # def index
  #   @answers = Answer.all
  # end
  # def show
  #   @answer = Answer.new()
  # end
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.save
    # redirect_to "/questions/#{@answer.question_id}"
    redirect_to question_path(@question)
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
    params.require(:answer).permit(:title, :content, :question)
  end
end
