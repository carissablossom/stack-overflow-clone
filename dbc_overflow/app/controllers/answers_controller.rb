class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params[:question_id]
    respond_to do |format|
      if @answer.save
        @question = @answer.question
        format.html { redirect_to @question }
        format.json { render :json => @answer,  :status => :created }
      else
       p "************* im in the else"
       format.html { redirect_to question_path } #how can we make this work?
       format.json { render :json => @answer.errors.full_messages, :status => :unprocessable_entity }
      end
    end

  end

  def upvote
    @answer = Answer.find(params[:id])
    @answer.increment!(:vote_counter)
    @question = @answer.question
      redirect_to @question
  end

  def downvote
    @answer = Answer.find(params[:id])
    @answer.decrement!(:vote_counter)
     @question = @answer.question
      redirect_to @question
  end



  def show
    'you fucked up'
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end
  private
    def answer_params
      params.require(:answer).permit(:content)
    end
end
