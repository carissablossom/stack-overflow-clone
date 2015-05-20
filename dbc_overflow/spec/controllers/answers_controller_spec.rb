RSpec.describe AnswersController, type: :controller do
  let(:question) { FactoryGirl.create(:question) }

  context "create" do
    it "should create a new question" do
      expect{
        post(:create, { :answer => { title: 'ebrl', content: 'dabf'}, id: question.id } )
        }.to change{ Answer.count }.by(1)
    end
  end

  describe "vote" do
    let!(:answer) { FactoryGirl.create :answer, question: question }
    
    context "upvote" do
      it "should increase answer vote by 1" do
        expect{ get(:upvote, {id: answer.id}) }.to change{ answer.reload.vote }.by(1)
      end
    end

    context "downvote" do
      it "should decrease answer vote by 1" do
        expect{ get(:downvote, {id: answer.id}) }.to change{ answer.reload.vote }.by(-1)
      end
    end
  end

end
