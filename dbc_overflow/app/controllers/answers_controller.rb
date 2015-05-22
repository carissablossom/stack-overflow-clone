class AnswersController < ApplicationController
  def new
  end

  def upvote
    @answer = Answer.find(params[:id])
    @answer.score += 1
    @answer.save
    render json: {score: @answer.score, id: @answer.id}
    # redirect_to :back
  end

  def downvote
    @answer = Answer.find(params[:id])
    @answer.score -= 1
    @answer.save
    render json: {score: @answer.score, id: @answer.id}
    # redirect_to :back
  end

  def create
    @answers = Answer.all
    @answer = Answer.new(question_id: params[:question_id], body: params[:answer][:body])
    p params
    # puts '*' * 50
    # p params[:answer][:body]
    # @answer.save
    # respond_to do |format|
      if @answer.save
        # puts '*' * 50
        # redirect_to @answer's showpage if format.html
        # format.html { redirect_to question_answer_path(Answer.last.id), notice: "Answer successfully created" }
        render json: @answer
      # else
      #   format.html { render action: 'index' }
      #   format.json { render :json => @answer.errors.full_messages, :status => :unprocessable_entity }
      else

        puts "failed"
      end

    # redirect_to :back
    # redirect_to "/questions/#{@answer.question_id}"

  end

  def show
  end
end
