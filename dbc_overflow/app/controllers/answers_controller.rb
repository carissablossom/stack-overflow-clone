class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
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
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.count += 1
    @answer.save
    redirect_to @question
  end

  def downvote
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.count -= 1
    @answer.save
    redirect_to @question
  end


  private
  def answer_params
    params.require(:answer).permit(:content)
  end


end
