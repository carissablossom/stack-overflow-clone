class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params[:question_id]
    @question = Question.find(params[:question_id])
    @answer.save
    # binding.pry
    render partial: "answer", locals: {answer: @answer, question: @question}
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def upvotes
    answer = Answer.find(params[:id])
    answer.votes += 1
    answer.save
    redirect_to question_path(answer.question_id)
  end

  def downvotes
    answer = Answer.find(params[:id])
    answer.votes -= 1
    answer.save
    redirect_to question_path(answer.question_id)
  end

  private
  def answer_params
    params.require(:answer).permit(:title, :content)
  end
end
