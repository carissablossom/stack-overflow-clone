class AnswersController < ApplicationController
  before_action :post_question, only: [:create, :upvote, :downvote]


  def create
    @answer = @question.answers.build(answer_params)
    respond_to do |format|
      if @answer.save
        format.html { redirect_to "/questions/#{@question.id}", notice: 'Question successfully created.' }
        format.json { render :json => @answer, :status => :created }
      else
        format.html { render "/questions/#{@question.id}" }
        format.json { render :json => @answer.erros.full_messages, :status => :unprocessable_entity }
      end
    end
  end

  def upvote
    @answer = Answer.find(params[:id])
    @answer.count += 1
    if @answer.save && request.xhr?
      render json: {count: @answer.count}
    else
      redirect_to @question
    end
  end

  def downvote
    @answer = Answer.find(params[:id])
    @answer.count -= 1
    if @answer.save && request.xhr?
      render json: {count: @answer.count}
    else
      redirect_to @question
    end
  end


  private
  def answer_params
    params.require(:answer).permit(:content)
  end

  def post_question
    @question = Question.find(params[:question_id])
  end

end
