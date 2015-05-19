class QuestionsController < ApplicationController

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
      redirect_to "/questions/#{@question.id}"
    else
      status 400
      'fu'
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.order(vote_count: :desc)
    @answer = Answer.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      redirect_to "/questions/#{@question.id}"
    else
      status 400
      'fu'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to "/"
  end

  def upvote
    @question = Question.find(params[:id])
    @question.vote_count += 1
    if @question.save
      redirect_to "/"
    else
      status 400
      'fu'
    end
  end

  def downvote
    @question = Question.find(params[:id])
    @question.vote_count -= 1 if @question.vote_count > 0
    if @question.save
      redirect_to "/"
    else
      status 400
      'fu'
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :content)
  end
end
