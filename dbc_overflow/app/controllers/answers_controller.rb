class AnswersController < ApplicationController
  def create
    @answer = Answer.new(post_params)
    @answer.question_id = params[:question_id]
    @answer.save
    redirect_to :back
    # redirect_to "/questions/#{params[:question_id]}"
  end

  def new
    @answer = Answer.new
  end

  def show
  end

  def upvote
    @answer = Answer.find(params[:id])
    @answer.vote += 1
    @answer.save
    redirect_to :back
  end

  def downvote
    @answer = Answer.find(params[:id])
    @answer.vote -= 1 if @answer.vote > 0
    @answer.save
    redirect_to :back

  end


 private
  def post_params
    params.require(:answer).permit(:title, :content)
  end
end
