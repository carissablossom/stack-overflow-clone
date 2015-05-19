class AnswersController < ApplicationController
  def new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params["question_id"]
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

  def upvote
    @answer = Answer.find(params[:a_id])
    @answer.vote_count += 1
    if @answer.save
      redirect_to "/questions/#{params[:q_id]}"
    else
      status 400
      'fu'
    end
  end

  def downvote
    @answer = Answer.find(params[:a_id])
    @answer.vote_count -= 1 if @answer.vote_count > 0
    if @answer.save
      redirect_to "/questions/#{params[:q_id]}"
    else
      status 400
      'fu'
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:title, :content, :question_id)
  end
end
