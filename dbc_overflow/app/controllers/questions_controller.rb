class QuestionsController < ApplicationController
  before_action :post_question, only: [:destroy, :show, :edit, :update, :upvote, :downvote]
  include HTTParty

  def index
    @questions = Question.all.sort_by(&:count).reverse
    # @quote = HTTParty.get("https://api.github.com/zen").body
    @quote = "oops we hit the limit"
  end

  def show
    @answers = @question.answers.sort_by(&:count).reverse
    @answer = Answer.new
  end

  def create
    @question = Question.new(question_params)
    @question.save
    redirect_to '/questions'
  end

  def destroy
    @question.destroy
    redirect_to '/'
  end

  def edit
  end

  def update
    if @question.update_attributes(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def upvote
    @question.count += 1
    @question.save
    redirect_to '/'
  end

  def downvote
    @question.count -= 1
    @question.save
    redirect_to '/'
  end

  private
  def question_params
    params.require(:question).permit(:title, :content)
  end

  def post_question
    @question = Question.find(params[:id])
  end
end
