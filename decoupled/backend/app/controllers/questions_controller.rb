class QuestionsController < ApplicationController
  #we have routes for index to get all the questions
  #a get to get one question by id
  #an action to create one question
  # an action to delete a question
  def index
    render json: { questions: Question.all }
  end

  def create
     @question = Question.new(post_params)
     if @question.save
       render json: { questions: Question.find(@question.id) }
     end

  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.where(id: params[:id]).first
    render json: { questions: @question }
  end

  def update
     @question = Question.find(params[:id])
    #saving
    @question.update_attributes(question_params)
    render json: { questions: @question }
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy #destroys all the associated answers also
    render json: { questions: @question }
  end

  def upvote
    @question = Question.find(params[:id])
    @question.vote += 1
    @question.save
    # redirect_to :action => :index
    render json: {"question" => Question.find(params[:id])}

  end

  def downvote
    @question = Question.find(params[:id])
    @question.vote -= 1 if @question.vote > 0
    @question.save
    render json: {"question" => Question.find(params[:id])}
  end

  private
  def question_params
    params.require(:question).permit(:title, :content)
  end

end
