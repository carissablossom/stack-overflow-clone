class QuestionsController < ApplicationController
  before_action :all_questions, only: [:edit, :show, :update, :destroy, :upvote, :downvote]
  include QuoteGetter

  def index
    @questions = Question.all.order(:created_at)
    @quote = quote
  end

  def new
    @questions = Question.new
  end

  def show
    @answers = @question.answers
  end

  def create
    @questions = Question.all
    @question = Question.new(question_params)
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question successfully created.' }
        format.json { render json: @question, status: :created }
      else
        format.html { render action: 'index' }
        format.json { render json: @question.errors.full_messages, status: :unprocessable_entity }
      end
    end
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
    @question.vote_totals += 1
    @question.save
    redirect_to question_path(@question)
  end

  def downvote
    @question.vote_totals -= 1
    @question.save
    redirect_to question_path(@question)
  end

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end

  def all_questions
    @question = Question.find(params[:id])
  end

end
