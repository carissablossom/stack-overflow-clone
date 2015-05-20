Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

describe "Question GET #index", :js => true do
  let!(:question) { FactoryGirl.create :question}

  it "should shows a list of questions" do
    visit root_path
    expect(page).to have_content(question.title)
  end

  it "should create a question through form" do
    visit root_path
    fill_in 'Title', with: question.title
    fill_in 'Content', with: question.content
    click_on('Save Question')
    expect(page).to have_content(question.title)
    expect(page).to have_content(question.content)
  end

  it "should raise votecount using upvote button" do
    visit root_path
    10.times { click_on('upvote') }
    expect(page).to have_content("10")
  end

  it "should decrease votecount using downvote button" do
    visit root_path
    10.times { click_on('downvote') }
    expect(page).to have_content("-10")
  end

end
