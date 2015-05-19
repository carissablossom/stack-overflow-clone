class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    # @question.save
  end

  def show
  end

  private
  def post_params
    params.require(:question).permit(:title, :body)
  end
end
