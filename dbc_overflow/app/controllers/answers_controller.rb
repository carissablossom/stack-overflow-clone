class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to(:back)
    else
      status 400
      'bad answer data'
    end
  end

  def upvote
    @answer = Answer.where(id: params[:answer_id]).first
    @answer.upvote
    @answer.save
    redirect_to "/questions/#{@answer.question_id}"
  end

  def downvote
    @answer = Answer.where(id: params[:answer_id]).first
    @answer.downvote
    @answer.save
    redirect_to "/questions/#{@answer.question_id}"
  end

  private
  def answer_params
    params.require(:answer).permit(:title,:content,:question_id)
  end
end
