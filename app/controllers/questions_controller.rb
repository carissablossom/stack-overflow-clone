class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy, :vote]
  before_action :set_sesh

  def index
    if request.xhr?
      get_paged_questions
      return render :'questions/_all_questions', layout: false
    else
      get_quote
      get_paged_questions
      @question = Question.new
    end
  end

  def new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      if request.xhr?
        get_paged_questions
        return render :'questions/_all_questions', layout: false
      else
        redirect_to @question
      end
    else
      get_quote
      get_paged_questions
      render :index, status: 400
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

  def vote
    if params[:vote] == 'upvote'
      @question.vote_count += 1
    elsif params[:vote] == 'downvote'
      @question.vote_count -= 1
    end
    if @question.save
      # session[:q_votes] ||= []
      session[:q_votes] << @question.id
      if request.xhr?
        render json: @question.vote_count
      else
        redirect_to root_path
      end
    else
      status 400
      'fu'
    end
  end

  private
  def set_question
    @question = Question.find(params[:id])
  end

  def set_sesh
    session[:q_votes] ||= []
  end

  def get_quote
    response = HTTParty.get(
      'https://api.github.com/zen',
      headers: {"User-Agent" => 'SF Dev BootCamp'},
      basic_auth: {username: ENV['USERNAME'], password: ENV['PASSWORD']}
    )
    if response.response.code == "200"
      @quote = Quote.create(content: response.parsed_response)
    else
      @quote = Quote.all.sample || Quote.new
    end
  end

  def question_params
    params.require(:question).permit(:title, :content)
  end

  def get_paged_questions
    @questions = Question.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end
end
