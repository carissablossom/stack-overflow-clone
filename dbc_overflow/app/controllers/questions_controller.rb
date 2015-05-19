class QuestionsController < ApplicationController
  def index
    @question = Question.all
  end

  def show
    @question = Question.where(id: params[:id]).first
    # @answers = @question.answers
  end

  def new
  end

  def edit
  end

  def create
  end


end
