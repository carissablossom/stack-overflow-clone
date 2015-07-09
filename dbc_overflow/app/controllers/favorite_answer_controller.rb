class FavoriteAnswersController < ApplicationController

  before_action :set_favorite_answer, only: :destroy

  def new
    @favorite_answer = FavoriteAnswer.new
  end

  def create
    @favorite_answer = FavoriteAnswer.new(question_params)

    if @favorite_answer.save
      redirect_to @favorite_answer
    else
      render 'new'
    end
  end

  def destroy
    @favorite_answer.destroy

    redirect_to questions_path
  end

  private

  def set_favorite_answer
    @favorite_answer = FavoriteAnswer.find(params[:id])
  end

  def favorite_answer_params
    params[:favorite_answer]
  end
end
