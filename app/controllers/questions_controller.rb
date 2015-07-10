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
    @answer = Answer.new(question: @question)

  end

  def new
    # if current_user
    @question = Question.new
    # format.json { render json: @question, status: :created, location: @question }
    render partial: 'new', layout: false, locals: {question: @question}
    # format.html{render: 'new', layout: false}
    # else
      # render 'sessions/new'
    # end
  end

  def create
    p "*"* 100
    p params
    @question = Question.new(question_params)

    if @question.save
      render partial: 'question', layout: false, locals: {question: @question}
    else
      render 'root'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    p "*" * 100
    p params
    p "*" * 100
    if params[:vote] == "Upvote"
      @question.votes += 1
      @question.save
      render :json => {:vote => @question.votes, :id => @question.id}
    elsif params[:vote] == "Downvote"
      @question.votes -= 1
      @question.save
      render :json => {:vote => @question.votes, :id => @question.id}
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
