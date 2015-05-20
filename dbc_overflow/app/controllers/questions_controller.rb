require 'rubygems'
require 'httparty'

class QuestionsController < ApplicationController


  def index
    # quote = HTTParty.get("https://api.github.com/zen")
    quote = HTTParty.get("https://api.github.com/zen",
      basic_auth: { username: ENV['USERNAME'] , password: ENV['PASSWORD'] })
    puts "**********************************************************"
    p ENV['USERNAME']
    p ENV['PASSWORD']
    p quote.to_json
    # reply = quote.to_h["message"]
    # if reply.include?("limit exceeded")
    #   # p "It includes it!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    #   @message = ["WTF Bro!", "Make it so!", "limit exceeeeded!"].sample
    # else
      @message = quote.to_json
    # end
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
    @question = Question.new(param_check)
    @question.save
    redirect_to @question
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


