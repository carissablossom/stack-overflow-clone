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
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question successfully created.' }
        format.json { render :json => @question, status: :created }
      else
        format.html { render action: 'index' }
        format.json { render :json => @question.errors.full_messages, status: :unprocessable_entity }
      end
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
    if request.xhr?
      render json: { count: @question.vote, id: @question.id }
    else
      raise 'fuck off'
    end
  end

  def downvote
    @question = Question.find(params[:id])
    @question.vote -= 1
    @question.save
    if request.xhr?
      render json: { count: @question.vote, id: @question.id }
    else
      raise 'fuck off'
    end
  end

  private

    def question_params
      params.require(:question).permit(:title, :content)
    end

end
