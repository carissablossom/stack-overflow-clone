require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  # before(:all) { Question.delete_all }
  let!(:question) { Question.create(title: "test title", content: "test content") }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response.body).to render_template("index")
    end

    describe "Testing Question upvote/downvote" do
      it "upvote should increase votecount by 1" do
        post :upvote, id: question
        expect(Question.where(id: question.id).first.count).to eq(1)
      end

      it "downvote should decrease votecount by 1" do
        post :downvote, id: question
        expect(Question.where(id: question.id).first.count).to eq(-1)
      end
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: question
      expect(response).to have_http_status(:success)
      expect(response.body).to render_template("show")
    end
  end
end
