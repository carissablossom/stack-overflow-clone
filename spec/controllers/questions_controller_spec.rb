describe QuestionsController, type: :controller do
  let(:question) do
    Question.create!(
      title: "whatever",
      content: "some stuff"
    )
  end
  context 'GET index' do
    before { get :index }
    it "should get index" do
      response.should be_ok
    end
    it "gets questions" do
      assigns(:questions).should be_a(ActiveRecord::Relation)
    end
    it "gets a quote" do
      assigns(:quote).should be_a(Quote)
    end
    it "assigns a question" do
      assigns(:question).should be_a(Question)
    end
  end

  context "POST create" do
    it "saves a new question and redirects" do
      expect{ post :create, question: {title: "whatever", content: "some stuff"} }.to change{Question.count}.by 1
      response.status.should eq 302
    end
    it "does not saves a new question with invalid input" do
      expect{ post :create, question: {title: "whatever"} }.to_not change{Question.count}
    end
  end

  context "GET #show" do
    before { get :show, id: question.id }
    it "gets questions" do
      assigns(:question).should be_a(Question)
    end
    it "assigns answers" do
      assigns(:answers).should be_a(ActiveRecord::Relation)
    end
    it "assigns answer" do
      assigns(:answer).should be_a(Answer)
    end
  end

  context "GET #edit" do
    before { get :edit, id: question.id }
    it "gets questions" do
      assigns(:question).should be_a(Question)
    end
  end

  context "PUT #update" do
    context "valid update" do
      before { put :update, id: question.id, question: {title: "new", content: "things"} }
      it "gets question" do
        assigns(:question).should be_a(Question)
      end
      it "updates the question" do
        Question.first.content.should match(/things/)
      end
      it "should redirect" do
        response.status.should eq 302
      end
    end

    context "invalid update" do
      before { put :update, id: question.id, question: {title: "new", content: ""} }
      it "should not update" do
        Question.first.content.should match(/some stuff/)
      end
      it "should give an error status" do
        response.status.should eq 400
      end
    end
  end

  context "DELETE #destroy" do
    before { delete :destroy, id: question.id }
    it "gets question" do
      assigns(:question).should be_a(Question)
    end
    it "destroys the question" do
      Question.count.should eq 0
    end
    it "should redirect" do
      response.status.should eq 302
    end
  end

  context "GET #vote" do
    before { get :vote, id: question.id, vote: "upvote" }
    it "gets question" do
      assigns(:question).should be_a(Question)
    end
    it "updates the vote count with an upvote" do
      Question.first.vote_count.should eq 1
    end
    it "updates the vote count with a downvote" do
      get :vote, id: question.id, vote: "downvote"
      Question.first.vote_count.should eq 0
    end
    it "should redirect" do
      response.status.should eq 302
    end
  end
end
