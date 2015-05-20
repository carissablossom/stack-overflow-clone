Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

describe "Question GET #show", :js => true do
  let!(:question) { FactoryGirl.create :question}
  let!(:answer) { Answer.create(content: "test answer content", question_id: "#{question.id}") }


  it "should shows question page with answer" do
    visit root_path
    click_on "#{question.title}"
    expect(page).to have_content(question.title)
    expect(page).to have_content(question.content)
    expect(page).to have_content(answer.content)
  end

  it "should create an answer through form" do
    visit root_path
    click_on "#{question.title}"
    fill_in 'Content', with: "testing"
    click_on('Create Answer')
    expect(page).to have_content("testing")
  end

  it "should raise votecount using upvote button" do
        visit root_path
    click_on "#{question.title}"
    10.times { click_on('upvote') }
    expect(page).to have_content("10")
  end

  it "should decrease votecount using downvote button" do
    visit root_path
    click_on "#{question.title}"
    10.times { click_on('downvote') }
    expect(page).to have_content("-10")
  end

  it "should edit question" do
    visit root_path
    click_on "#{question.title}"
    click_on "edit"
    fill_in 'Title', with: "New Title Testing"
    fill_in 'Content', with: "New Content Testing"
    click_on "Update Question"
    expect(page).to have_content("New Title Testing")
    expect(page).to have_content("New Content Testing")
  end

  it "should delete question" do
    visit root_path
    click_on "#{question.title}"
    click_on "delete"
    expect(page).to have_no_content(question.title)
    expect(page).to have_no_content(question.content)
  end

end
