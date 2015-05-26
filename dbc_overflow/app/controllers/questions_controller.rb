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

    respond_to do |format|
      if @question.save
        p "*"*40
        p "SAVED"
        format.html { render "questions/_question", locals: {question: @question}, notice: 'User was successfully created.' }
        format.js   {}
        format.json { render json: @question, status: :created}
      else
        format.html { render action: 'index' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
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
