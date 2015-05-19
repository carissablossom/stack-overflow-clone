class QuestionsController < ApplicationController
  def index
    @question = Question.new
    @questions = Question.order(vote_total: :desc)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(post_params)
    @question.save
    redirect_to action: "index"
  end

  def show
    @question = Question.where(id: params[:id]).first
    @answer = Answer.new
    @answers = @question.answers.order(vote_total: :desc)
  end

  def destroy
    @question.destroy
    redirect_to :action => 'index'
  end

  def edit
    @question = Question.where(id: params[:id]).first
  end

  def update
    @question = Question.where(id: params[:id]).first
    if @question.update_attributes(post_params)
      redirect_to :action => "show", :id => params[:id].to_i
    else
      redirect_to :action => "edit", :id => params[:id].to_i
    end
  end

  def upvote
    question = Question.where(id: params[:id]).first
    question.up_vote
    redirect_to :action => 'index'

  end

  def downvote
    question = Question.where(id: params[:id]).first
    question.down_vote
    redirect_to :action => 'index'
  end


  private
  def post_params
    params.require(:question).permit(:title, :content)
  end

end
