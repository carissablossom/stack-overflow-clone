class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
  end

  def create
    @question = Question.new(question_params)
    @question.save
    redirect_to '/questions'
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to '/'
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :content)
  end

end
