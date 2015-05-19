class QuestionsController < ApplicationController
  def create
    @question = Question.new(post_params)
    @question.save
    redirect_to :back
     # redirect_to :action => :index
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.where(id: params[:id]).first
    if @question
      @answers = @question.answers
    end
    @answer = Answer.new
  end

  def index
    @question = Question.new
    @questions = Question.all
    @answers = Answer.all
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy #destroys all the associated answers also
    redirect_to :action => :index
  end

  def edit
    @question = Question.find(params[:id])
    render "edit"
  end

  def update
    @question = Question.find(params[:id])
    #saving
    @question.update_attributes(post_params)
    redirect_to :action => :show
  end

  private
  def post_params
    params.require(:question).permit(:title, :content)
  end
end
