class QuestionsController < ApplicationController
  def new
    @question = Question.new

  end

  def create
     @question = Question.new(question_params)
     @question.save
    #  if @question.save
    #   status 200
    # else
    #   status 404
    # end
    redirect_to '/show'
  end

  def show
    @questions = Question.all
  end

  private

  def question_params
    params.require(:question).permit(:title,:content)
  end
end
