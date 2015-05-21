describe AnswersController, type: :controller do
  let(:question) do
    Question.create!(
      title: "whatever",
      content: "some stuff"
    )
  end
  let(:answer) do
    Answer.create!(
      title: "my answer",
      content: "my answer content",
      question_id: question.id,
    )
  end

  context "POST create" do
    it "saves a new answer and redirects" do
      expect{ post :create, question_id: question.id, answer: {title: "whatever", content: "some stuff"} }.to change{Answer.count}.by 1
      response.status.should eq 302
    end
    it "does not saves a new answer with invalid input" do
      expect{ post :create, question_id: question.id, answer: {title: "whatever"} }.to_not change{Answer.count}
    end
  end

  context "GET #vote" do
    before { get :vote, question_id: question.id, id: answer.id, vote: "upvote" }
    it "gets answer" do
      assigns(:answer).should be_a(Answer)
    end
    it "updates the vote count with an upvote" do
      Answer.first.vote_count.should eq 1
    end
    it "updates the vote count with a downvote" do
      get :vote, question_id: question.id, id: answer.id, vote: "downvote"
      Answer.first.vote_count.should eq 0
    end
    it "should redirect" do
      response.status.should eq 302
    end
  end
end
