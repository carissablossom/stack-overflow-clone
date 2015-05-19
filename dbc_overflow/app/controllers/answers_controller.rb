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
    # redirect_to @answer.question
    redirect_to @answer.question
  end

  def update
    @answer = Answer.find(params[:id])
    upvote_count = @answer.upvote
    downvote_count = @answer.downvote
    @answer.update(param_check)
    redirect_to @answer.question
  end

  private

  def param_check
    params.require(:answer).permit(:title, :content, :upvote, :downvote)
  end
end
