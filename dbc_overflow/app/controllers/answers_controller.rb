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
    @question = @answer.question
    respond_to do |format|
      if @answer.save
        format.html { redirect_to @question, notice:"Answer Created!" }
        format.json {render :json => @answer, :status => :created}
      else
        format.html {render action: 'index'}
        format.json { render :json => @answer.errors.full_messages, :status => :unprocessable_entity}
      end
    end
  end

  def upvote
    @answer = Answer.find(params[:id])
    @answer.upcount
    respond_to do |format|
      format.html { redirect_to @answer.question }
      format.json { render json: @answer }
    end
  end

  def downvote
    @answer = Answer.find(params[:id])
    @answer.downcount
    respond_to do |format|
      format.html { redirect_to @answer.question }
      format.json { render json: @answer }
    end
  end

  private

  def param_check
    params.require(:answer).permit(:title, :content, :upvote, :downvote)
  end
end
