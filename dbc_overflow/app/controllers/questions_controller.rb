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
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      redirect_to @question
    else
      render 'questions/edit'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def destroy
    Question.destroy(params[:id])
    redirect_to '/'
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
