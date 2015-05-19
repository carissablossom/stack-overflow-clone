class QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.save
    redirect_to "/questions/#{@question.id}"
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to '/'
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def index
    @question = Question.new
    @questions = Question.all

  end

  def edit
    p @question = Question.find(params[:id])
 end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      redirect_to '/'
    else
      render 'edit'
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :content)
  end

end
