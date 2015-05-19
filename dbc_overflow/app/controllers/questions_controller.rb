class QuestionsController < ApplicationController
  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @questions = Question.all
  end

  def show
    @question = Question.where(id: params[:id]).first
  end

  private
  # def show_params
  #   params.require(:question).permit(:id)
  # end

end
