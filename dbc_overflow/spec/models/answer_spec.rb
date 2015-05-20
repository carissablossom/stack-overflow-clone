RSpec.describe Answer, type: :model do
  context "create" do 
    let(:question) { FactoryGirl.create(:question) }

    context "valid" do
      it "should create an answer" do
        expect{
          Answer.create(
            title: 'hwe',
            content: "dwqf",
            question_id: question.id
            )
          }.to change{ Answer.count }.by(1)
      end
    end

    context "invalid" do
      it 'should not have empty title' do
        expect{ Answer.create!(content: "hello") }.to raise_error
      end

      it 'should not have empty content' do 
        expect{ Answer.create!(title: "hello") }.to raise_error 
      end

      it 'should have a question id' do
        expect{ Answer.create!(title: "heloo", content: "lauseya") }.to raise_error
      end
    end
  end
end
