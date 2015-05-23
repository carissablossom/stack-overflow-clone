class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params[:question_id]
    respond_to do |format|
      if @answer.save
        format.json {render :json => @answer, :status => :created}
      else
        render status: 500
      end
    end
  end

  def upvote
    @answer = Answer.find(params[:answer_id])
    if @answer.upvote
      respond_to do |format|
        format.json {render :json => @answer, :status => :created}
      end
    end
  end

  def downvote
    @answer = Answer.find(params[:answer_id])
    if @answer.downvote
      respond_to do |format|
        format.json {render :json => @answer, :status => :created}
      end
    end
  end

  private
  def answer_params
    params.require(:answer).permit(
          :title,
          :content
          )
  end

end
