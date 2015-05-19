class QuestionsController < ApplicationController

  def index

  end

  def new
    @question = Question.new
  end

  def create
     @question = Question.new(question_params)
     @question.save

     # redirect_to '/show'
  end

  def show
    # @question = Question.all
  end

  private
  def question_params
    params.require(:question).permit(:title,:content)
   end
end
