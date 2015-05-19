class QuestionsController < ApplicationController

  def index
    @question = Question.new
    @questions = Question.all
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

  def vote
    @question = Question.find(params[:id])
    @question.vote += params[:vote].to_i
    @question.save
    redirect_to @question
  end


  private

    def question_params
      params.require(:question).permit(:title, :content)
    end

end
