class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.save
    redirect_to questions_path
  end

  def upvote
    question = Question.find(params[:id])
    question.votes += 1
    question.save
    redirect_to questions_path
  end

  def downvote
    question = Question.find(params[:id])
    question.votes -= 1
    question.save
    redirect_to questions_path
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.sort_by { |answer| answer.created_at }
    @answer = Answer.new
  end

  def index
    @question = Question.new
    @questions = Question.order("created_at DESC")
    zen = HTTParty.get('https://api.github.com/zen', headers: {"User-Agent" => 'SF Dev BootCamp'}, basic_auth: {username: ENV['USERNAME'], password: ENV['PASSWORD']})
    if zen
      @quote = Quote.create!(content: zen.body)
    else
      @quote = Quote.all.sample
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if @question
      @question.destroy
    else
      status 404
    end
    redirect_to questions_path
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(question_params)
    redirect_to questions_path
  end

  private
  def question_params
    params.require(:question).permit(:title, :content)
  end
end
