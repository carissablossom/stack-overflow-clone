describe "Question" do
  let!(:question) { FactoryGirl.create :question }

  describe "#index" do
    before(:each) { visit root_path }

    context "create question" do
      it 'creates a new question and displays it on the page' do
        fill_in 'Title', with: 'test'
        fill_in 'Content', with: 'heeeeeelllllooooooooooo'
        click_button 'Create question'
        expect(page).to have_content('heeeeeelllllooooooooooo')
      end
    end

    context "upvote question" do
      it 'increases the vote count by one' do
        expect{ click_link "Upvote" }.to change{ question.reload.vote }.by(1)
      end
    end

    context "downvote question" do
      it 'decreases the vote count by one' do
        expect{ click_link "Downvote" }.to change{ question.reload.vote }.by(-1)
      end
    end

  end

  describe "#show" do
    before { visit question_path(question) }

    context "delete" do
      it 'deletes the question' do 
        expect{ click_button 'Delete question' }.to change{ Question.count }.by(-1)
      end
    end

  end

  describe "#edit" do
    before { visit edit_question_path(question) }

    context "update" do
      it 'form should change the question' do
        fill_in 'Title', with: 'test'
        fill_in 'Content', with: 'heeeeeelllllooooooooooo'
        click_button 'Update question'
        expect(page).to have_content('heeeeeelllllooooooooooo')
      end
    end
  end

end
