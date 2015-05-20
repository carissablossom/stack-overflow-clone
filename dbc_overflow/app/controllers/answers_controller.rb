class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    respond_to do |format|
      if @answer.save
        format.html { redirect_to(:back) }
        format.json { render :json => @answer, :status=> :created }
      else
        format.html { status 400; 'bad answer data' }
        format.json { render :json => @answer.errors.full_messages, :status => :unprocessable_entity }
      end
    end
  end

  def upvote
    @answer = Answer.where(id: params[:answer_id]).first
    @answer.upvote
    @answer.save
    respond_to do |format|
        format.html { redirect_to("/questions/#{@answer.question_id}") }
        format.json { render :json => @answer }
    end
  end

  def downvote
    @answer = Answer.where(id: params[:answer_id]).first
    @answer.downvote
    @answer.save
    respond_to do |format|
        format.html { redirect_to("/questions/#{@answer.question_id}") }
        format.json { render :json => @answer }
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:title,:content,:question_id)
  end
end
