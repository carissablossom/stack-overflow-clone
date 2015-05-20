class AnswersController < ApplicationController
  before_action :set_answer, only: [:vote]
  before_action :set_sesh

  def new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params["question_id"]
    if @answer.save
      if request.xhr?
        @question = @answer.question
        return render :'_answer', layout: false, locals: { answer: @answer }
      else
        redirect_to question_path(@answer.question.id)
      end
    else
      @question = Question.find(@answer.question.id)
      @answers = @question.answers
      render :'questions/show'
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def vote
    if params[:vote] == 'upvote'
      @answer.vote_count += 1
    elsif params[:vote] == 'downvote'
      @answer.vote_count -= 1
    end
    if @answer.save
      session[:a_votes] << @answer.id
      if request.xhr?
        render json: @answer.vote_count
      else
        redirect_to question_path(@answer.question.id)
      end
    else
      status 400
      'fu'
    end
  end

  # def upvote
  #   @answer.vote_count += 1
  #   if @answer.save
  #     redirect_to question_path(@answer.question.id)
  #   else
  #     status 400
  #     'fu'
  #   end
  # end

  # def downvote
  #   @answer.vote_count -= 1 if @answer.vote_count > 0
  #   if @answer.save
  #     redirect_to question_path(@answer.question.id)
  #   else
  #     status 400
  #     'fu'
  #   end
  # end

  private
  def set_answer
    @answer = Answer.find(params[:id])
  end

  def set_sesh
    session[:a_votes] ||= []
  end

  def answer_params
    params.require(:answer).permit(:title, :content, :question_id)
  end
end
