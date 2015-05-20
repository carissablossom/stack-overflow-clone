require 'httparty'

KEY = ENV['GITHUB_API_KEY']
HOST = ENV['GITHUB']

class QuestionsController < ApplicationController
  include HTTParty

  def index
    @questions = Question.all
    @question = Question.new
    @quote = HTTParty.get("https://api.github.com/zen", {headers: {'Authorization' => KEY, 'User-Agent' => 'bananaboat'}} )
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    respond_to do |format|
      if @question.save
        format.json {render :json => @question, :status => :created}
      else
        p "************** fucccccck"
        # format.html {render action: 'index'}
        # format.json { render :json => root_path.errors.full_messages, :status => :unprocessable_entity}
      end
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update(title: params[:question][:title],
                     content: params[:question][:content])
    redirect_to "/questions/#{params[:id]}"
  end

  def upvote
    @question = Question.find(params[:question_id])
    @question.upvote
    redirect_to root_path
  end

  def downvote
    @question = Question.find(params[:question_id])
    @question.downvote
    redirect_to root_path
  end

  private

  def question_params
    params.require(:question).permit(
      :title,
      :content
      )
  end

end
