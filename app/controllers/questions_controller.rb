class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    @zen_quote = Github.zen
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
    render 'new', layout: false
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      render 'show', layout: false
    else
      render 'new'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to question_path(@question)
    else
      @update_errors = @question.errors.full_messages
      render 'edit'
    end
  end

  def upvote
    @question = Question.find(params[:id])

    @question.upvote_by current_user unless current_user.id == @question.user_id
    redirect_to question_path(@question)
  end

  def downvote
    @question = Question.find(params[:id])

    @question.downvote_from current_user unless current_user.id == @question.user_id
    redirect_to question_path(@question)
  end

  # def unvote
  # end

  private

  def question_params
    params.require(:question).permit(:title, :content, :user_id)
  end

end
