class QuestionsController < ApplicationController
include QuestionsHelper
before_action :question_find, only: [:show, :up_vote, :down_vote]
# before_action :all_questions, only: [:index]
# before_action :all_answers, only: [:show]
  def edit
    question_find
  end
  def index
    all_questions
    @question = Question.new
  end

  def show
    @answers =  @question.answers
  end

  def create
    @question = Question.new(question_params)  #question_params is a method will make private
    @question.votes = 0
    @question.save
    redirect_to questions_path
  end

  def up_vote
    @question.up_vote
    redirect_to :back
  end

  def down_vote
   @question.down_vote
   redirect_to :back
  end
  
  private
  def question_params
    params.require(:question).permit(:title, :content)
  end
end
