class QuestionsController < ApplicationController
  def index
    @question = Question.all
  end
  def show
    #@question = Question.find(params[:id])
    # @answers = Answer.find(question_id: @question)
  end

  def new
  end

  def edit
  end

  def create
  end


end
