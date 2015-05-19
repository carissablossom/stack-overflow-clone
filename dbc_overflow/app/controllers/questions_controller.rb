class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.save
    redirect_to "/questions"
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def index
    @question = Question.new
    @questions = Question.all
  end

  def destroy
    @question = Question.find(params[:id])
    if @question
      @question.destroy
    else
      status 404
    end
    redirect_to "/questions"
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(question_params)
    redirect_to "/questions"
  end

  private
  def question_params
    params.require(:question).permit(:title, :content)
  end
end
