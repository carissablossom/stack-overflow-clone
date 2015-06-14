class VotesController < ApplicationController
  def create
    if params[:question_id]
      @question = Question.find(params[:question_id])
      @question.votes.create(vote_params)
    else params[:answer_id]
      @answer = Answer.find(params[:answer_id])
      @answer.votes.create(vote_params)
    end
    redirect_to @question
  end

  private
  def vote_params
    params.permit(:value)
  end
end



