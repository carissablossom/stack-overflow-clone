class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.save
    redirect_to "/questions/#{@question.id}"
  end

  def upvote
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.count += 1
    @answer.save
    redirect_to @question
  end

  def downvote
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.count -= 1
    @answer.save
    redirect_to @question
  end


  private
  def answer_params
    params.require(:answer).permit(:content)
  end


end
