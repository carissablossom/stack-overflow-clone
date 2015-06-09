module QuestionsHelper
  def question_find
    @question = Question.find(params[:id])
  end
end
