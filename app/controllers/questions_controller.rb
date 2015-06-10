class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :edit, :update]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    @question.save
    redirect_to @question
    #redirect_to question_path
  end

  def show
    @answer = Answer.new
    @answers = @question.answers
  end

  def edit
  end

  def update
    question_find

    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  private
  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :content)
  end
end
