class AnswersController < ApplicationController
  def new
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to "/questions/#{@answer.question_id}"
    else
      status 400
      'fu'
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def answer_params
    params.require(:answer).permit(:title, :content, :question_id)
  end
end
