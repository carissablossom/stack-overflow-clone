class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params[:question_id]
    if @answer.save
    @question = @answer.question
      redirect_to @question
    else
      'you fucked up'
    end

  end

  def show
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end
  private
    def answer_params
      params.require(:answer).permit(:content)
    end
end
