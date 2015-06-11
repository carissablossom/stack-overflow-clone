module QuestionsHelper
	def question_find
		@question = Question.find(params[:id])
	end
	def all_questions
		@questions = Question.all.order('created_at desc')
	end
end
