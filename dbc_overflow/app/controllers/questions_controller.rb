class QuestionsController < ApplicationController
  before_action :post_question, only: [:destroy, :show, :edit, :update, :upvote, :downvote]
  before_action :quote, only: :index
  include HTTParty

  def index
    @questions = Question.paginate(page: params[:page], :per_page => 10)
    #.paginate(page: params[:page], :per_page => 10)
    #.all.sort_by(&:count).reverse
    @question = Question.new
  end

  def show
    @answers = @question.answers.sort_by(&:count).reverse
    @answer = Answer.new
  end

  def create
    @questions =  Question.all.sort_by(&:count).reverse
    @question = Question.new(question_params)
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question successfully created.' }
        format.json { render :json => @question, :status => :created }
      else
        format.html { render 'index' }
        format.json { render :json => @question.erros.full_messages, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @question.destroy
    redirect_to '/'
  end

  def edit
  end

  def update
    if @question.update_attributes(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def upvote
    @question.count += 1
    @question.save
    redirect_to '/'
  end

  def downvote
    @question.count -= 1
    @question.save
    redirect_to '/'
  end

  private
  def question_params
    params.require(:question).permit(:title, :content)
  end

  def post_question
    @question = Question.find(params[:id])
  end

  def quote
    @quote = HTTParty.get("https://api.github.com/zen").body || "oops we hit the limit"
  end
end
