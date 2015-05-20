class QuestionsController < ApplicationController
  def create
    @question = Question.new(post_params)
    @question.save
    redirect_to :back
     # redirect_to :action => :index
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.where(id: params[:id]).first
    if @question
      @answers = @question.answers.order(:id)
    end
    @answer = Answer.new
  end

  def index

    default_quote = "Hello there!"
    response = HTTParty.get("https://api.github.com/zen", { params: ENV["CALVIN_TOKEN"]} )

    if response.response.is_a? Net::HTTPForbidden
      @quote = default_quote
    else
      @quote = response.parsed_response
    end

    @question = Question.new
    @questions = Question.all.order(:id)
    @answers = Answer.all

  #   default_quote = "Hello there!"
  #   response = HTTParty.get("https://api.github.com/zen")
  #   @quote = HTTParty.get("https://api.github.com/zen").parsed_response
  #   @question = Question.new
  #   @questions = Question.all.order(:id)
  #   @answers = Answer.all
  # rescue => e
  #   @quote = default_quote
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy #destroys all the associated answers also
    redirect_to :action => :index
  end

  def edit
    @question = Question.find(params[:id])
    render "edit"
  end

  def update
    @question = Question.find(params[:id])
    #saving
    @question.update_attributes(post_params)
    redirect_to :action => :show
  end

  def upvote
    @question = Question.find(params[:id])
    @question.vote += 1
    @question.save
    redirect_to :action => :index
  end

  def downvote
    @question = Question.find(params[:id])
    @question.vote -= 1 if @question.vote > 0
    @question.save
    redirect_to :back

  end

  private
  def post_params
    params.require(:question).permit(:title, :content)
  end
end
