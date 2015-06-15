class AnswersController < ApplicationController
  before_action :all_answers, only: [:upvote, :downvote]

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    respond_to do |format|
      if @answer.save
        format.html { redirect_to question_path(@question), notice: 'Answer successfully created.' }
        format.json { render json: @answer, status: :created }
      else
        format.html { render action: 'index' }
        format.json { render json: @answer.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def upvote
    @answer.vote_totals += 1
    @answer.save
    @question = Question.find(@answer.question_id)
    redirect_to question_path(@question)
  end

  def downvote
    @answer.vote_totals -= 1
    @answer.save
    @question = Question.find(@answer.question_id)
    redirect_to question_path(@question)
  end

  private
    def answer_params
      params.require(:answer).permit(:title, :content)
    end

    def all_answers
    @answer = Answer.find(params[:id])
    end
end

