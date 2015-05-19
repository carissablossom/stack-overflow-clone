class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @question = Question.new
  end

  def new
    @question = Question.new

  end

  def create
    @question = Question.new(question_params)
    @question.save
    redirect_to root_path
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
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

  def update
    @question = Question.find(params[:id])
    @question.update(title: params[:title],
                     content: params[:content])
    redirect_to "/questions/#{params[:id]}"
  end

  private

  def question_params
    params.require(:question).permit(
      :title,
      :content
      )
  end

end
