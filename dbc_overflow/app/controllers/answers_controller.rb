class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:id])
    @answer = @question.answers.build(answer_params)
    respond_to do |format|
      if @answer.save
        format.html { redirect_to question_path(@question), notice: 'Answer successfully created.' }
        format.json { render :json => @answer, status: :created }
      else
        format.html { redirect_to question_path(@question) }
        format.json { render :json => @answer.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def upvote
    @answer = Answer.find(params[:id])
    @question = @answer.question
    @answer.vote += 1
    @answer.save
    if request.xhr?
      render json: { count: @answer.vote, id: @answer.id }
    else
      raise 'fuck off'
    end
  end

  def downvote
    @answer = Answer.find(params[:id])
    @question = @answer.question
    @answer.vote -= 1
    @answer.save
    if request.xhr?
      render json: { count: @answer.vote, id: @answer.id }
    else
      raise 'fuck off'
    end
  end

  private

    def answer_params
      params.require(:answer).permit(:title, :content)
    end
end
