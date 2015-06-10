class AnswersController < ApplicationController
  before_action :set_answer, only: [:edit, :update, :destroy, :upvote, :downvote]
  before_action :set_question, only: [:create, :update]

  def create
    @answer = Answer.new(answer_params)
    @answer.question = @question
    respond_to do |format|
      if @answer.save
        format.html { render "questions/_answer", locals: {answer: @answer}, layout: false }
      else
        redirect_to @question
      end
    end
  end

  def edit
  end

  def update
    @answer.update(answer_params)
    if @answer.save
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @answer.destroy
    redirect_to question_path(@answer.question)
  end

  def upvote
    @answer.votes += 1

    if @answer.save
      render :json => @answer.votes
    else
      redirect_to question_path(@answer.question)
    end
  end

  def downvote
    @answer.votes -= 1

    if @answer.save
      render :json => @answer.votes
    else
      redirect_to question_path(@answer.question)
    end
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:content)
  end
end
