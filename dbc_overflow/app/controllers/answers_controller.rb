class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:id])
    @answer = @question.answers.build(answer_params)
    if @answer.save
      redirect_to question_path(@question)
    else
      redirect_to question_path(@question)
    end
  end

  def upvote
    @answer = Answer.find(params[:id])
    @question = @answer.question
    @answer.vote += 1
    @answer.save
    redirect_to @question
  end

  def downvote
    @answer = Answer.find(params[:id])
    @question = @answer.question
    @answer.vote -= 1
    @answer.save
    redirect_to @question
  end

  private

    def answer_params
      params.require(:answer).permit(:title, :content)
    end
end
