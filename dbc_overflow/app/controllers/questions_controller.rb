class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    # @question = Question.new
  end

  def new
    @question = Question.new
  end

  def create
    question = Question.new(question_params)
    question.save
    redirect_to questions_path
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
    # @answers = @question.answers
  end

  def update
    @question= Question.find(params[:id])
    @question.update_attributes(question_params)
    redirect_to :action => :show
  end

  def edit
    @question = Question.find(params[:id])
    render "edit"
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to root_path
  end

private
  def question_params
    params.require(:question).permit(
      :title,
      :content)
  end


end
