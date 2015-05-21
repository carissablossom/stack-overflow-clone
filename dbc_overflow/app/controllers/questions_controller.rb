class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.save
    @questions = Question.all
    render partial: "question", locals: { question: @question }
    # respond_to do |format|
    #   if @question.save
    #     format.html { render action: 'index', notice: 'question successfully added!'}
    #     format.json { render :json => @question, :status => :created }
    #   else
    #     format.html { render action: 'index'}
    #     format.json { render :json => @question.errors.full_messages, :status => :unprocessable_entity }
    #   end
    # end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to '/'
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers.order('created_at DESC').all
  end

  def index
    @question = Question.new
    @questions = Question.order('created_at DESC').all
    headers = { "User-Agent" => "StacksOnStacks",
                "Authorization" => ENV['GITHUB_KEY']}
    @quote = HTTParty.get("https://api.github.com/zen", headers: headers)
    # p @quote
  end

  def edit
    @question = Question.find(params[:id])
 end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      redirect_to '/'
    else
      render 'edit'
    end
  end

  def upvote
    @question = Question.find(params[:question_id])
    @question.vote_totals += 1
    @question.save
    redirect_to '/'
  end

  def downvote
    @question = Question.find(params[:question_id])
    @question.vote_totals -= 1
    @question.save
    redirect_to '/'
  end

  private
  def question_params
    params.require(:question).permit(:title, :content)
  end

end
