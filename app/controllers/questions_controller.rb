class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  def index
    response = HTTParty.get('https://api.github.com/zen', headers: {"User-Agent" => 'SF Dev BootCamp'}, basic_auth: {username: ENV['USERNAME'], password: ENV['PASSWORD']})
    if response.response.code == "200"
      @quote = Quote.create(content: response.parsed_response)
    else
      @quote = Quote.all.sample || Quote.new
    end
    @questions = Question.order(created_at: :desc)
    @question = Question.new
  end

  def new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question
    else
      status 400
      'fu'
    end
  end

  def show
    @answers = @question.answers.order(vote_count: :desc)
    @answer = Answer.new
  end

  def edit
  end

  def update
    if @question.update_attributes(question_params)
      redirect_to @question
    else
      status 400
      'fu'
    end
  end

  def destroy
    @question.destroy
    redirect_to root_path
  end

  def upvote
    @question.vote_count += 1
    if @question.save
      redirect_to root_path
    else
      status 400
      'fu'
    end
  end

  def downvote
    @question.vote_count -= 1 if @question.vote_count > 0
    if @question.save
      redirect_to root_path
    else
      status 400
      'fu'
    end
  end

  private
  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :content)
  end
end
