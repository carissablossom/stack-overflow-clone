module AnswerHelper
  def answer_find
    @answer = Answer.find(params[:id])
  end
end
