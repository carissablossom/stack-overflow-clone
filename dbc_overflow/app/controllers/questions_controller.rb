class QuestionsController < ApplicationController

  def index
    @question = Question.new
    @questions = Question.all.sort_by(&:vote).reverse
    @quote = ApplicationHelper.quote
  end

  # route /questions/:id
  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.sort_by(&:vote).reverse
    @answer = Answer.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      redirect_to 'show'
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    redirect_to questions_path
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      redirect_to @question
    end
  end

  def upvote
    @question = Question.find(params[:id])
    @question.vote += 1
    @question.save
    redirect_to request.referer
  end

  def downvote
    @question = Question.find(params[:id])
    @question.vote -= 1
    @question.save
    redirect_to request.referer
  end

  private

    def question_params
      params.require(:question).permit(:title, :content)
    end

end
