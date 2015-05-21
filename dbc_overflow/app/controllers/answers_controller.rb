class AnswersController < ApplicationController
 def create
  Answer.create!(
    question_id: params[:question_id],

    title: params[:answer][:title],

    content: params[:answer][:content],
    )
    redirect_to question_path(id: params[:question_id])

  end

end
