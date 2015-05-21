class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    puts '%' * 40
    p question_params
    if @question.save
      puts '*' * 40
      redirect_to action: 'index'
    else
      puts '!' * 40
      redirect_to action: 'index'
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def index
    @questions = Question.all
    @question = Question.new
  end

  def destroy
    # puts '$' * 50
    # p params
    @question = Question.find(params[:id])
    if @question.destroy
      puts '*' * 50
      redirect_to action: 'index'
    else
      'NOPE'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      redirect_to action: 'show'
    else
      redirect_to action: 'edit'
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :body)
  end
end
