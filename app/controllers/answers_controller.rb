class AnswersController < ApplicationController
  before_action :set_answer, only: [:edit, :update, :destroy, :upvote, :downvote]
  def create
    @answer = Answer.new(answer_params)
    @answer.question = Question.find(params[:question_id])
    @answer.save

    redirect_to @answer.question
  end

  def edit
  end

  def update
    @answer.update(answer_params)
    if @answer.save
      redirect_to Question.find(params[:question_id])
    else
      render 'edit'
    end
  end

  def destroy
    @answer.destroy
    redirect_to question_path(@answer.question)
  end

  def upvote
    @answer.votes += 1
    @answer.save
    redirect_to question_path(@answer.question)
  end

  def downvote
    @answer.votes -= 1
    @answer.save
    redirect_to question_path(@answer.question)
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:content)
  end
end
