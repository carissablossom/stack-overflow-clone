

class QuestionsController < ApplicationController
  def new

  end

  def create
    headers = {"User-Agent" => ENV['USER_AGENT'],
               "Authorization" => 'token ' + ENV["AUTHORIZATION"]}
    @resp = HTTParty.get("https://api.github.com/zen",
                             :headers => headers)

    @questions = Question.order(vote_counter: :desc)
    @question = Question.new(question_params)
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question successfully created.' }
        format.json { render :json => @question, :status => :created }
      else
        format.html { render action: 'index' }
        format.json { render :json => @question.errors.full_messages, :status => :unprocessable_entity }
      end
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
    respond_to do |format|
      format.html { redirect_to '/' }
      format.json { render :json => @question.vote_counter }
    end
  end

  def downvote
    @question = Question.find(params[:question_id])
    @question.decrement!(:vote_counter)
    respond_to do |format|
      format.html { redirect_to '/' }
      format.json { render :json => @question.vote_counter }
    end
  end


  def edit
    @question = Question.find(params[:id])
  end

  def destroy
    Question.destroy(params[:id])
    redirect_to '/'
  end

  def index
    headers = {"User-Agent" => ENV['USER_AGENT'],
               "Authorization" => 'token ' + ENV["AUTHORIZATION"]}
    @resp = HTTParty.get("https://api.github.com/zen",
                             :headers => headers)


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
