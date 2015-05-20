RSpec.describe Answer, type: :model do
  context "create" do 
    it 'should not have empty title' do
      answer = Answer.new(content: 'hello')
      expect(answer).to validate_presence_of(:title)
    end

    it 'should not have empty content' do 
      answer = Answer.new(title: 'hello')
      expect(answer).to validate_presence_of(:content)
    end
  end
end
