class AnswersController < ApplicationController
  def create
    @answer = Answer.new(post_params)
    @answer.question_id = params[:question_id]
    # @answer.save
    # redirect_to :back
    # redirect_to "/questions/#{params[:question_id]}"
    if @answer.save
      render json: {"html" => render_to_string(partial: 'answer.html.erb', locals: {answer: @answer})}
    end
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
    render json: {"answer" => Answer.find(params[:id])}
  end

  def downvote
    @answer = Answer.find(params[:id])
    @answer.vote -= 1 if @answer.vote > 0
    @answer.save
    render json: {"answer" => Answer.find(params[:id])}

  end


 private
  def post_params
    params.require(:answer).permit(:title, :content)
  end
end
