class AnswersController < ApplicationController

  def new
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    respond_to do |format|
      if @answer.save
        format.html { redirect_to @question, notice: 'answer successfully added!'}
        format.json { render :json => @answer, :status => :created }
      else
        format.html { render action: 'show'}
        format.json { render :json => @answer.errors.full_messages, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def upvote
    @answer = Answer.find(params[:answer_id])
    @answer.vote_totals += 1
    @answer.save
    @question = Question.find(params[:question_id])
    redirect_to "/questions/#{@question.id}"
  end

  def downvote
    @answer = Answer.find(params[:answer_id])
    @answer.vote_totals -= 1
    @answer.save
    @question = Question.find(params[:question_id])
    redirect_to "/questions/#{@question.id}"
  end

  private

  def answer_params
    params.require(:answer).permit(:title, :content, :question_id)
  end

end
