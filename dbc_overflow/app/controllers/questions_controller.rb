

class QuestionsController < ApplicationController
  def new

  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to '/'
    else
      status 400
      redirect_to '/'
    end

  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      redirect_to @question
    else
      render 'questions/edit'
    end
  end

  def upvote
    @question = Question.find(params[:question_id])
    @question.increment!(:vote_counter)
    redirect_to '/'
  end

  def downvote
    @question = Question.find(params[:question_id])
    @question.decrement!(:vote_counter)
    redirect_to '/'
  end


  def edit
    @question = Question.find(params[:id])
  end

  def destroy
    Question.destroy(params[:id])
    redirect_to '/'
  end

  def index
    # p @response.headers["x-ratelimit-remaining"]
    p "))))))))))))))))))"

    headers = {"User-Agent" => ENV['USER_AGENT'], "Authorization" => 'token ' + ENV["AUTHORIZATION"]}
     @response = HTTParty.get("https://api.github.com/zen", :headers => headers)
    p @response

    @questions = Question.order(vote_counter: :desc)
    @question = Question.new
  end

  def show
    @question = Question.where(id: params[:id]).first
    @answer=Answer.new(question_id: @question.id)
  end


  private
  def question_params
    params.require(:question).permit(:title, :content)
  end

end
