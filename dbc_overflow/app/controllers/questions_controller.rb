class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    @question = Question.new
  end

  def create
    @question = Question.create(question_params)
    redirect_to root_path
  end

  def show
    @question = Question.find(params[:id])
    @answers = Answer.where(question_id: @question.id)
    @answer = Answer.new
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path
  end

  def edit
    @question = Question.find(params[:id])
  end


private

  def question_params
    params.require(:question).permit(:title, :content)
  end
end
