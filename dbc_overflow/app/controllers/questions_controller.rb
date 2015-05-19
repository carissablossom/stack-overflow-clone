class QuestionsController < ApplicationController
  include HTTParty

  def index
    @questions = Question.all.sort_by(&:count).reverse
    @quote = HTTParty.get("https://api.github.com/zen").body
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.sort_by(&:count).reverse
    @answer = Answer.new
  end

  def create
    @question = Question.new(question_params)
    @question.save
    redirect_to '/questions'
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to '/'
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def upvote
    @question = Question.find(params[:id])
    @question.count += 1
    @question.save
    redirect_to '/'
  end

  def downvote
    @question = Question.find(params[:id])
    @question.count -= 1
    @question.save
    redirect_to '/'
  end

  private
  def question_params
    params.require(:question).permit(:title, :content)
  end

end
