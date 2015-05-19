class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id].to_i)
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id].to_i)
    @answer = Answer.new(post_params)
    @answer.save
    redirect_to action: "questions/show", :question_id => params[:question_id].to_i
  end

  # def show
  #   @answer = Answer.where(id: params[:id]).first
  # end

  private

  def post_params
    params.require(:answer).permit(:title, :content)
  end

end
