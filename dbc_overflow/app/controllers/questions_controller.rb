class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order('votes DESC')
    @question = Question.new

  end

  def create
    @question = Question.create(post_params)
    redirect_to questions_path
  end

  def new
    @question = Question.new(params[:title], params[:content])
    if @question.save
      redirect_to @question
    else
      render new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(post_params)
    redirect_to :action => :show
    # if @question.update()
    #   redirect_to "/questions/#{question.id}"
    # else
    #   render 'edit'
    # end
  end


  def show
    @question = Question.find(params[:id])
    p"THIS IS WHAT WE ARE LOOKING FOR ******************"
    p @answers = @question.answers
    @answer = Answer.new
    # @answers = Answer.where(question_id: @question.id)
     # @answer = Answer.new(params[:title],params[:id])
  end


  def upvote
    @question = Question.find(params[:question_id])
    @question.votes += 1
    @question.save

    redirect_to questions_path
  end

  def downvote
    @question = Question.find(params[:question_id])
    @question.votes -=1
    @question.save

    redirect_to questions_path
  end
  def destroy
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answers.destroy
    @question.destroy

    redirect_to questions_path
  end

private
  def post_params
    params.require(:question).permit(:title, :content)
  end
end
