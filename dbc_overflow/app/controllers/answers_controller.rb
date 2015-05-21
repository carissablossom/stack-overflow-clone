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


  def upvote
    answer = Answer.where(id: params[:id]).first
    respond_to do |format|
      if answer.up_vote
        format.html { redirect_to question_path(answer.question_id), method: :get}
        format.json { render :json => answer }
      else
        format.html {render action: 'index' }
        format.json {render :json => answer.errors.full_messages, :status => :unprocessable_entity }
      end
    end
  end

  def downvote
    answer = Answer.where(id: params[:id]).first
    if answer.down_vote
    redirect_to question_path(answer.question_id), :method => :get
    end
  end

  private

  def post_params
    params.require(:answer).permit(:title, :content)
  end

end
