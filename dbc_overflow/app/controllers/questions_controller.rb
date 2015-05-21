require 'httparty'
class QuestionsController < ApplicationController
  def index
    @question = Question.all.order(:id)
    auth = {:username => "eshuster", :password => "Varenka2000"}
    @response = HTTParty.get("https://api.github.com/zen", :basic_auth => auth)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create!(title: params[:question][:title], text: params[:question][:text], vote_count: params[:vote_count])
    redirect_to questions_path
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.where(id: params[:id]).first
    @question.destroy
    redirect_to questions_path
  end

  def widget
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to questions_path
    else
      redirect_to questions_path
    end
  end

  def question_params
    params.require(:question).permit(:title, :text, :vote_count)
  end

  def upvote
    @question = Question.where(id: params[:id]).first
    @question.vote_count += 1
    @question.save
    render json: @question
  end

  def downvote
    @question = Question.where(id: params[:id]).first
    @question.vote_count -= 1
    @question.save
    render json: @question
  end



end
