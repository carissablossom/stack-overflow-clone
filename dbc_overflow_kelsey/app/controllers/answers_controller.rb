class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    # @answer = @question.answers.create(answer_params)
    @answer = @question.answers.new(answer_params)
    if @question.save
      redirect_to @question
    else
      render 'new'
  end

  private
    def answer_params
      params.require(:answer).permit(:title, :content)
    end
end
