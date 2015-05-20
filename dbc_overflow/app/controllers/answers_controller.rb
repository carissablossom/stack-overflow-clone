class AnswersController < ApplicationController

  def index
    @answers = Answers.all
  end

  def show
  end

  def new
    @answer = Answer.new
  end

  def create
  end

  def delete
  end

end
