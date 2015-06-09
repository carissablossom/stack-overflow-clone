class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find_by_id(params[:id])
    @answers = Answer.where(question_id: @question.id)
  end
end
