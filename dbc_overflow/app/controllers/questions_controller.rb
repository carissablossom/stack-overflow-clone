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
    @question = Question.new(strong_params)
    if @question.save
      p "Great! It saved!"
    else
      p "Shit it didn't save!"
    end
  end

    private

    def strong_params
      params.require(:question).permit(:title, :content)
    end

end
