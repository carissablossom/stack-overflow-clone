class QuestionsController < ApplicationController
  def create
    p params
    @question = Question.new(title:params[:question][:title], content:params[:question][:content])
    if @question.save
      redirect_to question_path(@question)
    end
  end

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answers = Answer.where(question_id: @question.id)
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path
  end

  def edit
    @question = Question.find(params[:id])
  end
end
