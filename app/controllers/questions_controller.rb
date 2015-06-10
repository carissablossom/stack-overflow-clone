class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  def index
    @questions = Question.all
    @quote = Quote.fetch
  end

  def new
    @question = Question.new

    respond_to do |format|
      format.html { render "_form", locals: {question: @question}, layout: false}
    end
  end

  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { render '_question', locals: { question: @question }, layout: false }
      else
        render 'new'
      end
    end
  end

  def show
    @answer = Answer.new
    @answers = @question.answers
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  def upvote
    @question.votes += 1
    if @question.save
      render :json => @question.votes
    else
      redirect_to question_path
    end
  end

  def downvote
    @question.votes -= 1
    if @question.save
      render :json => @question.votes
    else
      redirect_to question_path
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :content)
  end
end
