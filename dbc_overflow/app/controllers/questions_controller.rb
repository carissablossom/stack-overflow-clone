class QuestionsController < ApplicationController
  def index
    @quote = QuoteGetter.new.get_quote
    if !@quote
      @randomquote = Quote.find(rand(0..59)+1)
    end
    @quote ||= @randomquote
    Quote.create(content: @quote)
    @questions = Question.all
    @question = Question.new
  end

  def show
    @question = Question.where(id: params[:id]).first
    @answer_set = @question.answers
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def destroy
    @question = Question.where(id: params[:id]).first
    p "hello destroy" * 10
    @question.destroy
    redirect_to action: 'index', status: 303
    # redirect_to :index
  end

  def create
    @question = Question.new(question_params)
    if request.xhr?
      if @question.save
        render partial: "questions/show_title", locals: { question: @question }
      else
        status 400
      end
    else
      if @question.save
        redirect_to action: 'index', status: 303
      else
        status 400
        'bad question data'
      end
    end
  end

  def update
    # params.inspect
    @question = Question.where(id: params[:id]).first
    @question.title = params["question"]["title"]
    @question.content = params["question"]["content"]
    # @question.point_count = params["question"]["point_count"]
    @question.save
    redirect_to "/questions/#{@question.id}"
  end

  def edit
    @question = Question.where(id: params[:id]).first
  end

  def upvote
    @question = Question.where(id: params[:question_id]).first
    @question.upvote
    @question.save
    redirect_to "/questions/#{@question.id}"
  end

  def downvote
    @question = Question.where(id: params[:question_id]).first
    @question.downvote
    @question.save
    redirect_to "/questions/#{@question.id}"
  end

  private
  def question_params
    params.require(:question).permit(:title,:content)
  end
end
