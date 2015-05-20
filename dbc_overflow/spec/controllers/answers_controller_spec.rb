require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let!(:answer) { Answer.create(content: "test answer content") }
  let!(:question) { Question.create(title: "test title", content: "test content") }


  describe "Testing Answer upvote/downvote" do
    it "upvote should increase votecount by 1" do
      post :upvote, {id: answer, question_id: question}
      expect(Answer.where(id: answer.id).first.count).to eq(1)
    end

    it "downvote should decrease votecount by 1" do
      post :downvote, {id: answer, question_id: question}
      expect(Answer.where(id: answer.id).first.count).to eq(-1)
    end
  end

end

