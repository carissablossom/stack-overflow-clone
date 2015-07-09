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
    render partial: 'question_form', layout:false, local: {question: @question}
  end

  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'yay'}
        format.json {
          hash = @question.as_json
          hash['html'] = render_to_string partial: 'question_list_item', formats:['html'], locals: {question: @question}
          render json: hash, status: :created
        }
      else
        format.html { render action: 'new'}
        format.json { render json: @question.errors.full_messages, status: 400 }
      end
    end

    # if @question.save
    #   redirect_to question_path(@question)
    # else
    #   render 'new'
    # end
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
