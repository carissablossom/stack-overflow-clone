class QuestionsController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc)
    @question = Question.new
  end

  def new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to "/questions/#{@question.id}"
    else
      status 400
      'fu'
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      redirect_to "/questions/#{@question.id}"
    else
      status 400
      'fu'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to "/"
  end

  private
  def question_params
    params.require(:question).permit(:title, :content)
  end
end
