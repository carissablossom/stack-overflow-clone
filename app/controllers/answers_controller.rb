class AnswersController < ApplicationController
  include AnswerHelper

  def create
    @answer = Answer.new(answer_params)
    @answer.question = Question.find(params[:question_id])
    @answer.save

    redirect_to @answer.question
  end

  def edit
    answer_find
  end

  def update
    answer_find
    @answer.update(answer_params)
    if @answer.save
      redirect_to Question.find(params[:question_id])
    else
      render 'edit'
    end
  end

  def destroy
    answer_find
    @answer.destroy

    redirect_to question_path(@answer.question)
  end

  private
  def answer_params
    params.require(:answer).permit(:content)
  end
end
