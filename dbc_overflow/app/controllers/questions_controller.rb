require 'rubygems'
require 'httparty'

class QuestionsController < ApplicationController


  def index
    # Use when authentication not desired:
    # quote = HTTParty.get("https://api.github.com/zen")

    quote = HTTParty.get("https://api.github.com/zen",
      basic_auth: { username: ENV['USERNAME'], password: ENV['PASSWORD'] })

    reply = quote.to_json.to_s
    if reply.include?("limit exceeded")
      @message = ["WTF Bro!", "Make it so!", "limit exceeeeded!"].sample
    else
      @message = quote.to_json.to_s[1..-2]
    end

    @questions = Question.all.order(:id)
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @answers = Answer.where(question_id: @question.id).order('upvote DESC')
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @questions = Question.all
    @question = Question.new(param_check)
    respond_to do |format|
      if @question.save
        puts "SAVE*************************************************************"
        format.html { redirect_to @question, notice:"Question Created!" }
        format.json {render :json => @question, :status => :created}
      else
        format.html {render action: 'index'}
        format.json { render :json => @question.errors.full_messages, :status => :unprocessable_entity}
      end
    end

  end

  def destroy
    Question.destroy(params[:id])
    redirect_to action: "index"
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    upvote_count = @question.upvote
    downvote_count = @question.downvote
    @question.update(param_check)
    if (upvote_count == @question.upvote) && (downvote_count == @question.downvote)
      redirect_to @question
    else
      redirect_to action: "index"
    end
  end

  # def upvote
  #   @question = Question.find(params[:id])
  #   @question.upcount
  #   redirect_to action: "index"
  # end

  private

  def param_check
    params.require(:question).permit(:title, :content, :upvote, :downvote)
  end

end


