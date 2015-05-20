class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params[:question_id]
    @answer.save
    redirect_to "/questions/#{@answer.question_id}"

  end

  def show
  end

  def upvote
    @answer = Answer.find(params[:answer_id])
    @answer.upvote
    redirect_to "/questions/#{@answer.question_id}"
  end

  def downvote
    @answer = Answer.find(params[:answer_id])
    @answer.downvote
    redirect_to "/questions/#{@answer.question_id}"
  end

  private
  def answer_params
    params.require(:answer).permit(
          :title,
          :content
          )
    #params.require(:question_id).permit! #how can allow mutiple params and not do the manual assignment of id on line8
  end

end
