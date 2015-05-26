class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def create
    @questions = Question.all
    @question = Question.new(strong_params)
    if @question.save
      p "Great! It saved!"
      redirect_to index
    else
      p "Shit! It didn't save!"
      render "index"
    end

  end

    private

    def strong_params
      params.require(:question).permit(:title, :content)
    end

end
