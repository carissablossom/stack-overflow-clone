module AnswersHelper
	def all_answers
		@answers = Answers.all.order('created_at desc')
	end
	def answer_find
		@answer = Answer.find(params[:id])
	end
end
