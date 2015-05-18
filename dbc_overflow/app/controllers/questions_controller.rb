class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  # route /questions/:id
  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

end
