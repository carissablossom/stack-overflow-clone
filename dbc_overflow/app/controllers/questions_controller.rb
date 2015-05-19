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
      'u failed'
    end
  end

  def show
    @question = Question.find(params[:id])
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

  end

  def update
    puts '^' * 50
    p params
    @question = Question.find(params[:id])
    # if @question.save
    #   redirect_to action: 'show'
    # end
  end

  private
  def question_params
    params.require(:question).permit(:title, :body)
  end
end
