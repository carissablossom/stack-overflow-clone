class AnswersController < ApplicationController
  before_action :set_answer, only: [:upvote, :downvote]

  def new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params["question_id"]
    if @answer.save
      redirect_to question_path(@answer.question.id)
    else
      @question = Question.find(@answer.question.id)
      @answers = @question.answers
      render :'questions/show'
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def upvote
    @answer.vote_count += 1
    if @answer.save
      redirect_to question_path(@answer.question.id)
    else
      status 400
      'fu'
    end
  end

  def downvote
    @answer.vote_count -= 1 if @answer.vote_count > 0
    if @answer.save
      redirect_to question_path(@answer.question.id)
    else
      status 400
      'fu'
    end
  end

  private
  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:title, :content, :question_id)
  end
end
