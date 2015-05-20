describe "Answer" do
  let!(:question) { FactoryGirl.create :question}
  before(:each) { visit question_path(question) }

  context "create" do
    it 'creates a new answer and displays it on the page' do
      fill_in 'Title', with: 'test'
      fill_in 'Content', with: 'heeeeeelllllooooooooooo'
      click_button 'Answer question'
      expect(page).to have_content('heeeeeelllllooooooooooo')
    end
  end

  context "destroy" do
  end

  context "upvote" do
    let!(:answer) { FactoryGirl.create :answer, question: question }
    it 'increases the vote count by one' do
      visit question_path(question)
      expect{ within('li') { click_link "Upvote" } }.to change{ answer.reload.vote }.by(1)
    end
  end

  context "downvote" do
    let!(:answer) { FactoryGirl.create :answer, question: question }
    it 'decreases the vote count by one' do
      visit question_path(question)
      expect{ within('li') { click_link "Downvote" } }.to change{ answer.reload.vote }.by(-1)
    end
  end

end
