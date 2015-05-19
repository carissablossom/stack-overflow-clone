class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(post_params)
    @answer.question_id = params[:question_id]
    @answer.save
    redirect_to "/questions/#{params[:question_id]}"
    # @question = Question.find(params[:question_id].to_i)
    # @answer = Answer.new(post_params)
    # @answer.save
    # redirect_to action: "questions/show", :question_id => params[:question_id].to_i
  end

  # def show
  #   @answer = Answer.where(id: params[:id]).first
  # end

  # def upvote
  #   question = Question.where(id: params[:id]).first
  #   question.up_vote
  # end

  # def downvote
  #   self.down_vote
  # end

  private

  def post_params
    params.require(:answer).permit(:title, :content)
  end

end
