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

  def edit
    @questions = Question.all
    @question = Question.find(params[:id])
    render "index"
  end

  def update
    @questions = Question.all
    @question = Question.find(params[:id])
    @question.update_attributes(strong_params)
    if @question.save
      p "Great! It saved!"
      redirect_to index
    else
      p "Shit! It didn't save!"
      render "index"
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to index
  end



    private

    def strong_params
      params.require(:question).permit(:title, :content, :id)
    end

end
