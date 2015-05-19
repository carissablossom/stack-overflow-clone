class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    # @answer = Answer.new(answer_params)
    #@answer.save
    @answer = Answer.create(
      title: params[:title],
      content: params[:content],
      question_id: params[:id])
  end

  def show
  end

  private
  # def answer_params
  #   params.require(:answer).permit(
  #         :title,
  #         :content,
  #         :question_id
  #         )
  # end

end
