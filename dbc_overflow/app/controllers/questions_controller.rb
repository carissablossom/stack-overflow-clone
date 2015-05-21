class QuestionsController < ApplicationController

  def index
    @question = Question.new
    @questions = Question.all.sort_by(&:created_at).reverse
    @quote = get_quote
  end

  # route /questions/:id
  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.sort_by(&:vote).reverse
    @answer = Answer.new
    @quote = get_quote
  end

  def create
    @question = Question.new(question_params)
    respond_to { |format|
      if @question.save
        format.html { redirect_to questions_path }
        format.json { render json: @question, status: :created }
      else
        format.html { redirect_to 'show' }
        format.json { render json: @question.errors.full_messages, status: :unprocessable_entity }
      end
    }
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
    respond_to { |format|
      format.html { redirect_to request.referer }
      format.json { render json: @question }
    }
  end

  def downvote
    @question = Question.find(params[:id])
    @question.vote -= 1
    @question.save
    respond_to { |format|
      format.html { redirect_to request.referer }
      format.json { render json: @question }
    }
  end

  private

    def question_params
      params.require(:question).permit(:title, :content)
    end

    def get_quote
      ApplicationHelper.quote
    end

end
