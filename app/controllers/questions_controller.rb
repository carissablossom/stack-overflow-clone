require 'github'

class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    @quote = Github.quote
    p @quote
    p "*" * 100
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def new
    # if current_user
      @question = Question.new
    # else
      # render 'sessions/new'
    # end
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to question_path(@question)
    else
      render 'new'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if params[:commit] == "Upvote"
      @question.votes += 1
      @question.save
      redirect_to question_path(@question)
    elsif params[:commit] == "Downvote"
      @question.votes -= 1
      @question.save
      redirect_to question_path(@question)
    else
      if @question.update(question_params)
        redirect_to question_path(@question)
      else
        @update_errors = @question.errors.full_messages
        render 'edit'
      end
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :content, :user_id)
  end

end
