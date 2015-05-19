class QuestionsController < ApplicationController
  def new

  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to '/'
    else
      status 400
      redirect_to '/'
    end

  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @questions = Question.all
    @question = Question.new

  end

  def show
    @question = Question.where(id: params[:id]).first
    @answer=Answer.new(question_id: @question.id)
  end

  private
  def question_params
    params.require(:question).permit(:title, :content)
  end

end
