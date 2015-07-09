class FavoriteQuestionsController < ApplicationController

  before_action :set_favorite_question, only: :destroy

  def new
    @favorite_question = FavoriteQuestion.new
  end

  def create
    @favorite_question = FavoriteQuestion.new(question_params)

    if @favorite_question.save
      redirect_to @favorite_question
    else
      render 'new'
    end
  end

  def destroy
    @favorite_question.destroy

    redirect_to questions_path
  end

  private

  def set_favorite_question
    @favorite_question = FavoriteQuestion.find(params[:id])
  end

  def favorite_question_params
    params[:favorite_question]
  end
end
